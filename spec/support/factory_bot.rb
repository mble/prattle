require 'factory_bot'

FactoryBot.definition_file_paths << File.join('spec', 'factories')
FactoryBot.find_definitions

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
