module Parrot

class Menu
	
  def help
     "Usage parrot [options] \n"+
     "-p, --parrot  Re-tweet direct messages \n"+
     "-f, --follow Automatically follow users who are following me \n"+
     "-v, --version show version \n"+
     "-h, --help show this message \n"
  end
  
  def parrot
   
  end
 
  def follow
  end

  def version
     "1.0"
  end

end
end
