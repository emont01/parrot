#!/usr/bin/env ruby
$:.unshift(File.dirname(__FILE__))

require 'parrot_module.rb'

if self.to_s == "main"
    parrot = Parrot::Parrot.new
    if ARGV.length != 1
        puts parrot.help
        exit 0
    end
    begin
        OptionParser.new do |opts|
            opts.banner = parrot.help
            opts.on('-v', '--version') { puts parrot.version }
            opts.on('-p', '--parrot') { puts "messages tweeted: #{parrot.do_tweet_direct_messages}" }
            opts.on('-f', '--follow') { puts "users followed back: #{parrot.do_follow_back}" }
            opts.on('-h', '--help') { puts parrot.help }
        end.parse!
    rescue OptionParser::InvalidOption
        puts parrot.help
    end
end

