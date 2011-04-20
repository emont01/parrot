#!/usr/bin/env ruby
require "test/unit"
require "rubygems"
require "twitter"
require "parrot"

puts "####################  #{__FILE__}  ####################"
class TestParrot < Test::Unit::TestCase
    def test_twitter_tokens
        assert_equal "B9aOm7lxTUChbg2jXmaw", Parrot::CONSUMER_KEY
        assert_equal "JfPabhEfRbPOwScFsHUj42q6XcVIRac9UpGig2W5VZE", Parrot::CONSUMER_SECRET
        assert_equal "284132864-YZTcAHSdWHYMKtTU7YcPtAcjYTG5jM9emoCkGQuq", Parrot::OAUTH_TOKEN
        assert_equal "rcv5dJTwF1VKPUaChoCp8EiRq01JCJxt7KoCZeS0", Parrot::OAUTH_TOKEN_SECRET
    end

    def test_login
        parrot_bot = Parrot::Parrot.new
        assert_equal true, parrot_bot.twitter_client.is_a?(Twitter::Client)
        parrot_bot.home_timeline
    end

    def __test_get_all_following_requests
        parrot_bot = Parrot::Parrot.new
        assert_equal false, parrot_bot.followers.empty?
        parrot_bot.followers.each{ |user| parrot_bot.__unfolow__(user.id) }
        assert_equal true, parrot_bot.pending_follow_back?
        parrot_bot.do_follow_back
        assert_equal true, parrot_bot.pending_follow_back?
    end

    def test_tweet_messages
        parrot_bot = Parrot::Parrot.new
        parrot_bot.direct_messages.each{ |message|
            puts "Message: '#{message.text}' create at: #{message.created_at} "
            puts "message id #{message.id} | #{message.id_str} "
            puts "recipient: #{message.recipient.name}"
        }

        parrot_bot.direct_messages.each{ |message| parrot_bot.__mark_unread__(message) }
        assert_equal true, parrot_bot.pending_messages?
        parrot_bot.do_tweet_direct_messages
        assert_equal true, parrot_bot.pending_messages?
    end

end

