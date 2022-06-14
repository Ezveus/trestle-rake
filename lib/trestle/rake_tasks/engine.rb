module Trestle
  module RakeTasks
    class Engine < Rails::Engine
      config.assets.precompile << 'trestle/rake_tasks.css'
    end
  end
end
