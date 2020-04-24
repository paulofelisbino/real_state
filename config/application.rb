require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '**', '*.{rb,yml}')]
    config.i18n.available_locales = [:en, 'pt-BR']
    config.i18n.default_locale = 'pt-BR'

    config.to_prepare do
      Clearance::PasswordsController.layout "my_passwords_layout"
      Clearance::SessionsController.layout "admin/login"
      Clearance::UsersController.layout "my_admin_layout"
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
