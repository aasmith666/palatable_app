require 'spec_helper'

	describe UsersController do
		render_views
  
  #describe "GET 'index'" do
   # it "should be successful" do
    #  get 'index'
    #  response.should be_success
 #   end
 # end
	describe "GET 'show'" do

		before(:each) do
			@user = Factory(:user)
			User.stub!(:find, @user.id).and_return(@user)
		end

		it "should be successful" do
			get :show, :id => @user
			response.should be_success
		end

		it "should find the right user" do
			get :show, :id => @user
			assigns(:user).should == @user
		end
		
		it "should have the right title" do
			get :show, :id => @user
			response.should have_selector("title", :content => @user.username)
		end

		it "should include the user's name" do
			get :show, :id => @user
			response.should have_selector("h1", :content => @user.username)
		end

		it "should have a profile image" do
			get :show, :id => @user
			response.should have_selector("h1>img", :class => "gravatar")
		end
	end		
		
	describe "GET 'new'" do
		it "should be successful" do
			get :new
			response.should be_success
		end
    
		it "should have the right title" do
			get :new
			response.should have_selector('title', :content => "Sign Up")
		end
		
		it "should have a username field" do
			get :new
			response.should have_selector("input[name='user[username]'][type='text']")
		end
		
		it "should have a real name field" do
			get :new
			response.should have_selector("input[name='user[real_name]'][type='text']")
		end
		
		it "should have an email field" do
			get :new
			response.should have_selector("input[name='user[email]'][type='text']")
		end
		
		it "should have a password field" do
			get :new
			response.should have_selector("input[name='user[password]'][type='password']")
		end
		
		it "should have a password confirmation field" do
			get :new
			response.should have_selector("input[name='user[password_confirmation]'][type='password']")
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
				#@user = Factory(:user)
				@attr = { :username => "New User", :real_name => "Real Name", :email => "user@example.com",
                  :password => "foobar666", :password_confirmation => "foobar666" }
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
				flash[:success].should =~ /Welcome to Pal.atab.le!/i
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

  #describe "GET 'show'" do
    #it "should be successful" do
     #get 'show'
      #response.should be_success
    #end
 #end


