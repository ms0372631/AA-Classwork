require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RedditClone
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    
    #TODO: Add this to every rails project to allow form_authenticity_token
    Rails.configuration.action_controller.per_form_csrf_tokens = true

    #Add this to only selected controllers which can use the form_authenticity_token
    #self.per_form_csrf_tokens = true

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
