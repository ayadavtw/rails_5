# config/initializers/sidekiq.rb
Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://172.13.1.8:6379/0', password: "password" }
  config.server_middleware do |chain|
    chain.add DistributedTracing::SidekiqMiddleware::Server
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://172.13.1.8:6379/0', password: "password" }
  config.client_middleware do |chain|
    chain.add DistributedTracing::SidekiqMiddleware::Client
  end
end