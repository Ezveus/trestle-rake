require 'rake'

Rake::Task.clear # Necessary to avoid tasks being loaded several times in dev mode
Rails.application.load_tasks

Trestle.admin(:rake_tasks, scope: Trestle::RakeTasks, path: 'rake_tasks') do
  routes do
    post :run_task
  end

  controller do
    before_action :fetch_tasks

    def index
    end

    def run_task
      task = params[:task]

      if @rake_tasks.include?(task)
        Rake::Task[task].reenable # In case the same task is invoked a second time.
        Rake::Task[task].invoke

        redirect_to admin.path(:index),
                    notice: I18n.t('run_success', scope: 'trestle_rake_tasks',
                                   default:              "'%{task_name}' was launched",
                                   task_name:            I18n.t(task, scope: 'trestle_rake_tasks', default: task))
      else
        redirect_to admin.path(:index),
                    notice: I18n.t('unknown_task', scope: 'trestle_rake_tasks',
                                   default:              "'%{task_name}' does not exists",
                                   task_name:            I18n.t(task, scope: 'trestle_rake_tasks', default: task))
      end
    end

    private

    def fetch_tasks
      @rake_tasks = Rake::Task.tasks.map(&:name)
    end
  end
end
