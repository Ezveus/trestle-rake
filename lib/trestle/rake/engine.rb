module Trestle
  module Rake
    class Engine < Rails::Engine
      config.assets.precompile << 'trestle/rake.css'
    end
  end
end
