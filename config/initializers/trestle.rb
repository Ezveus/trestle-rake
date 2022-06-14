Trestle.configure do |config|
  config.hook("stylesheets") do
    stylesheet_link_tag "trestle/rake"
  end

  config.hook("view.header") do
    render "trestle/rake/header"
  end
end
