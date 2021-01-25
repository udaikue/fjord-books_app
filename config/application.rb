require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module BooksApp
  class Application < Rails::Application
    config.load_defaults 6.1
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
  end
end
