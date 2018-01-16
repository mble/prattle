if defined?(RSpec)
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)
end
