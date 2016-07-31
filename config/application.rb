require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
Bundler.require(*Rails.groups)

module Prattle
  class Application < Rails::Application
    config.time_zone = 'London'
    config.i18n.default_locale = :en
  end
end
