class Rack::Attack
  # Configure cache store.
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  # Allow all local traffic
  whitelist('allow-localhost') do |req|
    '127.0.0.1' == req.ip || '::1' == req.ip
  end

  # Allow an IP address to make 5 requests every 5 seconds
  throttle('req/ip', limit: 10, period: 5) do |req|
    req.ip
  end

  # Send the following response to throttled clients.
  self.throttled_response = ->(env) {
    retry_after = (env['rack.attack.match_data'] || {})[:period]
    [
        # 429 Too many requests
        # The user has sent too many requests in a given amount of time ("rate limiting").
        # Additional HTTP Status Codes - RFC 6585
        429,
        { 'Content-Type' => 'application/json', 'Retry-After' => retry_after.to_s },
        [{ error: "Throttle limit reached. Retry later." }.to_json]
    ]
  }
end
