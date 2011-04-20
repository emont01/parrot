#!/bin/usr/env ruby

require "rubygems"
require "twitter"

module Parrot
    CONSUMER_KEY="B9aOm7lxTUChbg2jXmaw"
    CONSUMER_SECRET="JfPabhEfRbPOwScFsHUj42q6XcVIRac9UpGig2W5VZE"
    OAUTH_TOKEN="284132864-YZTcAHSdWHYMKtTU7YcPtAcjYTG5jM9emoCkGQuq"
    OAUTH_TOKEN_SECRET="rcv5dJTwF1VKPUaChoCp8EiRq01JCJxt7KoCZeS0"

    class Parrot
        attr_reader :twitter_client

        def initialize()
            # Certain methods require authentication. To get your Twitter OAuth credentials,
            # register an app at http://dev.twitter.com/apps
            Twitter.configure do |config|
              config.consumer_key = CONSUMER_KEY
              config.consumer_secret = CONSUMER_SECRET
              config.oauth_token = OAUTH_TOKEN
              config.oauth_token_secret = OAUTH_TOKEN_SECRET
            end
            @twitter_client = Twitter::Client.new
        end

        def home_timeline
            @twitter_client.home_timeline
        end

        def followers
            @twitter_client.followers.users
        end

        def direct_messages
            @twitter_client.direct_messages()
        end

        def pending_follow_back?
            index = @twitter_client.followers.users.index{ |user| !user.following }
            (index == nil)? false : true
        end

        def do_follow_back
            to_follow_back = []
            followers.each { |user|
                to_follow_back << user.id unless user.following
            }
            to_follow_back.each{ |user_id| @twitter_client.follow(user_id) }
        end

        def __unfolow__(user_id)
            @twitter_client.unfollow(user_id)
        end

        def __mark_unread__(message)
            #@twitter_client.
        end
    end

end

