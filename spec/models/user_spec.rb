require 'spec_helper'

describe User do
  before(:each) do
		@attr = { 
			:username => "Example User", 
			:real_name => "Allison Smith",
			:email => "user@example.com",
			:password => "ratfink666",
			:password_confirmation => "ratfink666"
		}
	end
	
	it "should create a new instance given valid attributes" do
		#User.create!(:name => "Example User", :email => "user@example.com")
		User.create!(@attr)
	end
	
	it "should require a username" do
		#no_name_user = User.new(:email => "user@example.com")
		no_name_user = User.new(@attr.merge(:username => ""))
		no_name_user.should_not be_valid
	end
  
	it "should require an email address" do
		#no_email_user = User.new(:name => "Example User")
		no_email_user = User.new(@attr.merge(:email => ""))
		no_email_user.should_not be_valid
	end
  
	it "should reject real names that are too long" do
		long_name = "a" * 76
		long_name_user = User.new(@attr.merge(:real_name => long_name))
		long_name_user.should_not be_valid
	end
  
	it "should accept valid email addresses" do
		addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
		addresses.each do |address|
			valid_email_user = User.new(@attr.merge(:email => address))
			valid_email_user.should be_valid
		end
	end
 
	it "should reject invalid email addresses" do
		addresses = %w[user@foo,com THE_USER_at_foo.bar.org first.last@foo]
		addresses.each do |address|
			invalid_email_user = User.new(@attr.merge(:email => address))
			invalid_email_user.should_not be_valid
		end
	end
  
	it "should reject duplicate email address" do
		User.create!(@attr)
		user_with_duplicate_email = User.new(@attr)
		user_with_duplicate_email.should_not be_valid
	end
  
	it "should reject identical email addresses (uppercase)" do
    #upcased_email = "USER@EXAMPLE.COM"  WRONG WAY TO DO THIS
		upcased_email = @attr[:email].upcase
		User.create!(@attr.merge( :email => upcased_email))
		user_with_duplicate_email = User.new(@attr)
		user_with_duplicate_email.should_not be_valid
	end
	
	describe "passwords" do
    
		before(:each) do
			@user = User.new(@attr)
		end
    
		it "should have a password attribute" do
			#User.new(@attr).should respond_to(:password)
			@user.should respond_to(:password)
		end
    
		it "should have a password confirmation attribute" do
			#User.new(@attr).should respond_to(:password)
		@user.should respond_to(:password_confirmation)
		end
	end
	
	describe "password validations" do
    
		it "should require a password" do
			User.new(@attr.merge(:password => "", :password_confirmation => "")).
			should_not be_valid
		end
    
		it "should require a matching password confirmation" do
			User.new(@attr.merge(:password_confirmation => "invalid")).
			should_not be_valid
		end
    
		it "should reject short passwords" do
			short = "a" * 6
			hash = @attr.merge(:password => short, :password_confirmation => short)
			User.new(hash).should_not be_valid
		end
    
		it "should reject long passwords" do
			long = "a" * 41
			hash = @attr.merge(:password => long, :password_confirmation => long)
			User.new(hash).should_not be_valid
		end
	end
	
	describe "Users" do

		describe "signup" do

			describe "failure" do

				it "should not make a new user" do
					lambda do
						visit signup_path
						fill_in "Username",     :with => ""
						fill_in "Real name",	:with => ""
						fill_in "Email",        :with => ""
						fill_in "Password",     :with => ""
						fill_in "Confirmation", :with => ""
						click_button
						response.should render_template('users/new')
						response.should have_selector("div#error_explanation")
					end.should_not change(User, :count)
				end
			end
			
			describe "success" do

				it "should make a new user" do
					lambda do
						visit signup_path
						fill_in "Name",         :with => "Example User"
						fill_in "Email",        :with => "user@example.com"
						fill_in "Password",     :with => "foobar"
						fill_in "Confirmation", :with => "foobar"
						click_button
						response.should have_selector("div.flash.success",
                                        :content => "Welcome")
						response.should render_template('users/show')
					end.should change(User, :count).by(1)
				end
			end
		end
	end
end
