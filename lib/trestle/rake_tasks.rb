require_relative 'rake_tasks/version'

require 'trestle'

require_relative 'rake_tasks/engine' if defined?(Rails)
