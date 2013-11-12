 class ContentController < ApplicationController
 	 http_basic_authenticate_with :name => " dhh", :password => "secret", :except => [:main]
  def main
    
  end
  def crud
  	
  end
   def popup
  	
  end
end