require 'spec_helper'

	describe UsersController do
		render_views
  
		#before(:each) do
			#@base_title = "pal.atab.le | "
		#end
  
  #describe "GET 'index'" do
   # it "should be successful" do
    #  get 'index'
    #  response.should be_success
 #   end
 # end
	describe "GET 'new'" do
		it "should be successful" do
			get 'new'
			response.should be_success
		end
    
		it "should have the right title" do
			get 'new'
			response.should have_selector('title', :content => "Sign Up")
		end
  	end
	
	describe "POST 'create'" do

		describe "failure" do

			before(:each) do
				@attr = { 	:username => "", :real_name => "", :email => "", :password => "",
							:password_confirmation => "" }
			end

			it "should not create a user" do
				lambda do
					post :create, :user => @attr
				end.should_not change(User, :count)
			end

			it "should have the right title" do
				post :create, :user => @attr
				response.should have_selector("title", :content => "Sign up")
			end

			it "should render the 'new' page" do
				post :create, :user => @attr
				response.should render_template('new')
			end
		end
		
		describe "success" do

			before(:each) do
				@attr = { :username => "New User", :real_name => "Real Name", :email => "user@example.com",
                  :password => "foobar", :password_confirmation => "foobar" }
			end

			it "should create a user" do
				lambda do
					post :create, :user => @attr
				end.should change(User, :count).by(1)
			end

			it "should redirect to the user show page" do
				post :create, :user => @attr
				response.should redirect_to(user_path(assigns(:user)))
			end    
		
			it "should have a welcome message" do
				post :create, :user => @attr
				flash[:success].should =~ /Welcome to Palatable/i
			end
		end
	end
end  

  #describe "GET 'create'" do
  #  it "should be successful" do
  #    get 'create'
  #    response.should be_success
  #  end
  #end

 # describe "GET 'edit'" do
 #   it "should be successful" do
  #    get 'edit'
  #    response.should be_success
 #   end
 # end

 # describe "GET 'update'" do
 #   it "should be successful" do
  #    get 'update'
 #     response.should be_success
  #  end
  #end

 # describe "GET 'show'" do
 #   it "should be successful" do
 #     get 'show'
 #     response.should be_success
 #   end
 # end


