Trestle.configure do |config|
  config.hook("stylesheets") do
    stylesheet_link_tag "trestle/rake_tasks"
  end

  config.hook("view.header") do
    render "trestle/rake_tasks/header"
  end
end
