#!/usr/bin/env ruby

require "test/unit"
require "rubygems"
require "twitter"
require "parrot"
require "menu"


class TestMenu < Test::Unit::TestCase
   


   def test_help
    choice = Parrot::Menu.new
    expected = "Usage parrot [options] \n"+
     "-p, --parrot  Re-tweet direct messages \n"+
     "-f, --follow Automatically follow users who are following me \n"+
     "-v, --version show version \n"+
     "-h, --help show this message \n"
      assert_equal expected,choice.help
   end
   
   def test_parrot
	    choice = Parrot::Menu.new
        assert_equal true,choice.parrot.size > 0
   end
   
   def test_follow
     choice = Parrot::Menu.new   
      
   end
   
   def test_version
	 choice = Parrot::Menu.new
	assert_equal '1.0',choice.version
   end 

end
