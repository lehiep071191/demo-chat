require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DemoChat
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.active_job.queue_adapter = :sidekiq
    config.cache_store = :redis_store, {
	  	host: "localhost",
		  port: 6379,
		  db: 0,
	}, {expires_in: 7.days}
    # Include the authenticity token in remote forms.
    config.action_view.embed_authenticity_token_in_remote_forms = true
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
