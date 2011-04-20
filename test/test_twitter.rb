require "twitter"

 Twitter.user_timeline("parrot_project",:page => 1).each do | h |
	#puts h.text
end

Twitter.configure do |config|
  config.consumer_key = "B9aOm7lxTUChbg2jXmaw"
  config.consumer_secret = "JfPabhEfRbPOwScFsHUj42q6XcVIRac9UpGig2W5VZE"
  config.oauth_token = "284132864-YZTcAHSdWHYMKtTU7YcPtAcjYTG5jM9emoCkGQuq"
  config.oauth_token_secret = "rcv5dJTwF1VKPUaChoCp8EiRq01JCJxt7KoCZeS0"
end


