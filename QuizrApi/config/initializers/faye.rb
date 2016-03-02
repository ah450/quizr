Rails.application.config.middleware.delete Rack::Lock

Faye.logger = Rails.logger
unless Rails.const_defined?(:Server) || !ENV['IS_SERVER'].nil?
  Faye.logger.debug 'Ensure reactor running!'
  Faye.ensure_reactor_running!
end
Rails.application.config.middleware.use FayeRails::Middleware, mount: '/faye', engine: {
  type: Faye::Redis,
  host: 'localhost'
}, timeout: 25 do

end
