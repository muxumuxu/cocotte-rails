class Rack::Attack
  # Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  throttle('api/ip', limit: 2, period: 1.minute) do |req|
    req.ip
  end
end