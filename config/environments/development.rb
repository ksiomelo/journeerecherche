Journeerecherche::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = true

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = false
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  Paperclip.options[:command_path] = "/usr/local/bin/"
  
  
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
  :address              => "smtp.ecp.fr",
  :port                 => 587,
  :user_name            => '', # your ecp login
  :password             => '', # your ecp pass
  :authentication       => 'plain',
  :enable_starttls_auto => true  }
  
  config.action_mailer.perform_deliveries = true
end
