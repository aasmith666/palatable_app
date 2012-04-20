require 'spec_helper'

describe "LayoutLinks" do

	it "should have a Login page at '/sessions'" do
		get '/'
		response.should have_selector('title', :content => "Sign in")
	end
	
	it "should have a Signup page at '/users/new'" do
		get '/new'
		response.should have_selector('title', :content => "Sign Up")
	end

	it "should have a Help page at '/users/help'" do
		get '/help'
		response.should have_selector('title', :content => "Help")
	end
	
	#it "should have a Profile page at '/users/profile'" do
		#get '/profile'
		#response.should have_selector('title', :content => "Profile")
	#end
	
	#it "should have a View page at '/show'" do
		#get '/show'
		#response.should have_selector('title', :content => "View")
	#end
	
	#describe "when not signed in" do
		#it "should have a signin link" do
			#visit root_path
			#response.should have_selector("a", :href => signin_path,
            #                             :content => "Sign in")
		#end
	#end	
end
