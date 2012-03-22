require 'spec_helper'

describe "LayoutLinks" do

	it "should have a Home page at '/users'" do
		get '/'
		response.should have_selector('title', :content => "Home")
	end
	
	#it "should have a Login page at '/users'" do
  
	it "should have a Signup page at '/users/new'" do
		get '/new'
		response.should have_selector('title', :content => "Sign up")
	end

	it "should have a Help page at '/users/help'" do
		get '/help'
		response.should have_selector('title', :content => "Help")
	end
	
	#it "should have a View page at '/show'" do
		#get '/show'
		#response.should have_selector('title', :content => "View")
	#end

end
