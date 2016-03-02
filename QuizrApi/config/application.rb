require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module QuizrApi
  class Application < Rails::Application
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.assets.enabled = false
    config.generators do |g|
      g.assets false
    end
    config.api_only = true
    config.active_job.queue_adapter = :sidekiq unless Rails.env.test?
  end
end
