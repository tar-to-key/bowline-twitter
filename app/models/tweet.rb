require "twitter"

class Tweet < SuperModel::Base
  class << self
    def poll
      destroy_all
      timeline.each do |tweet|
        create(tweet)
      end
    end

    def update(status)
      twitter.update(status)
      poll
    end

    def refresh()
      destroy_all
      timeline.each do |tweet|
        create(tweet)
      end
    end

    private
    def timeline
      twitter.friends_timeline.collect {|t|
        t.profile_image_url = t.user.profile_image_url
        t.delete('user')
        t.to_hash
      }
    end

    def twitter
      httpauth = Twitter::HTTPAuth.new(
        AppConfig.username, 
        AppConfig.password
        )
      Twitter::Base.new(httpauth)
    end
  end
end
