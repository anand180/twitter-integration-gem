module TwitterIntegration
  class Tweet
    attr_reader :text
    attr_reader :time

    def initialize(tweet)
      @text = tweet['text']
      @time = tweet['created_at']
    end
  end
end
