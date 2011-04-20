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

if Twitter.direct_messages.empty?
	puts "hola again"
end

Twitter.direct_messages(:page=>1).each do |dm|
	puts "hola"
end
num = 0

 Twitter.follower_ids(:cursor => -1).each do | al | 
	@a = al
	puts @a[0]	
	puts @a[1]
	num += 1
end
