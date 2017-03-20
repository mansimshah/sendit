if defined? Sidekiq
  redis_url = ENV['REDISTOGO_URL']

  Sidekiq.configure_server do |config|
    config.redis = {
        url: redis_url,
        namespace: 'workers_#{Rails.env}'
    }
  end
  Sidekiq.configure_client do |config|
    config.redis = {
        url: redis_url,
        namespace: 'workers_#{Rails.env}'
    }
  end
end