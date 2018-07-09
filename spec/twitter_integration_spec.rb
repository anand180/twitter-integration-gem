RSpec.describe TwitterIntegration do
  it 'has a version number' do
    expect(TwitterIntegration::VERSION).not_to be nil
  end

  describe TwitterIntegration::TwitterHandler do
    describe '#user_info' do
      let(:twitter_handler) { described_class.new }

      context 'when a valid screen name is passed' do
        screen_name = 'twitterdev'
        let(:result) { twitter_handler.user_info screen_name }

        it 'returns a User object' do
          expect(result.user.class).to eq(TwitterIntegration::User)
        end

        it "returns the user's info" do
          expect(result.user.screen_name).to eq(screen_name)
        end
      end

      context 'when an invalid screen name is passed' do
        let(:result) { twitter_handler.user_info '' }

        it 'returns a success value of false' do
          expect(result.success).to eq(false)
        end
      end
    end

    describe '#recent_tweets' do
      let(:twitter_handler) { described_class.new }

      context 'when a valid screen name is passed' do
        screen_name = 'twitterdev'
        let(:result) { twitter_handler.recent_tweets screen_name }

        it 'returns an array of Tweet objects' do
          expect(result.tweets.class).to eq(Array)
          expect(result.tweets.first.class).to eq(TwitterIntegration::Tweet)
        end

        context 'when no count is passed' do
          it "returns the user's ten most recent tweets" do
            expect(result.tweets.size).to eq(10)
          end
        end

        context 'when an integer count is passed' do
          let(:result) { twitter_handler.recent_tweets screen_name, count: 5 }

          it "returns the user's 'count' most recent tweets" do
            expect(result.tweets.size).to eq(5)
          end
        end
      end

      context 'when an invalid screen name is passed' do
        let(:result) { twitter_handler.recent_tweets '' }

        it 'returns a success value of false' do
          expect(result.success).to eq(false)
        end
      end
    end
  end
end
