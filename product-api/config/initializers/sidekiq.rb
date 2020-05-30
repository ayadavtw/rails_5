# config/initializers/sidekiq.rb
Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://172.13.1.8:6379/0', password: "password" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://172.13.1.8:6379/0', password: "password" }
end