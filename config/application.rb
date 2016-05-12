require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Psdb
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # config.active_record.schema_format controls the format for dumping the database schema to a file.
    # The options are :ruby (the default) for a database-independent version that depends on migrations, or :sql for a set of (potentially database-dependent) SQL statements.
    # You cannot dump a tsvector column to schema.rb. Instead, you need to switch to using the native PostgreSQL SQL format schema dump. In your config/application.rb you should set
    # https://github.com/Casecommons/pg_search
    config.active_record.schema_format = :sql
  end
end
