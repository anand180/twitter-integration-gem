module TwitterIntegration
  class TwitterHandler
    def initialize
      @base_url = 'https://api.twitter.com'
      @bearer_token = _bearer_token(ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'])
    end

    def user_info(screen_name)
      url = "#{@base_url}/1.1/users/show.json?screen_name=#{screen_name}"
      headers = { 'Authorization' => "Bearer #{@bearer_token}" }

      resp = HTTParty.get(url, headers: headers)

      return OpenStruct.new(user: nil, success: false) if resp.code != 200

      OpenStruct.new(
        user: User.new(screen_name, JSON.parse(resp.body)),
        success: true
      )
    end

    def recent_tweets(screen_name, count: 10)
      url = "#{@base_url}/1.1/statuses/user_timeline.json?screen_name=#{screen_name}&count=#{count}&include_rts=true"
      headers = { 'Authorization' => "Bearer #{@bearer_token}" }

      resp = HTTParty.get(url, headers: headers)

      return OpenStruct.new(tweets: [], success: false) if resp.code != 200

      OpenStruct.new(
        tweets: JSON.parse(resp.body).map { |t| Tweet.new(t) },
        success: true
      )
    end

    private

    def _bearer_token(key, secret)
      credentials = Base64.encode64("#{URI.encode_www_form_component(key)}:#{URI.encode_www_form_component(secret)}").delete("\n")
      url = "#{@base_url}/oauth2/token"
      body = 'grant_type=client_credentials'
      headers = {
        'Authorization' => "Basic #{credentials}",
        'Content-Type' => 'application/x-www-form-urlencoded;charset=UTF-8'
      }

      resp = HTTParty.post(url, body: body, headers: headers)

      JSON.parse(resp.body)['access_token']
    end
  end
end
