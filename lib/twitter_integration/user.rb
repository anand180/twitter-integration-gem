module TwitterIntegration
  class User
    attr_reader :screen_name
    attr_reader :user

    def initialize(screen_name, user)
      @screen_name = screen_name
      @user = user
    end
  end
end
