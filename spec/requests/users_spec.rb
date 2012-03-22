require 'spec_helper'

describe "Users" do
	
	describe "signup" do

		describe "failure" do

			it "should not make a new user" do
				lambda do
					visit new_path
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
					visit new_path
					fill_in "Username",     :with => "Example User"
					fill_in "Real name",	:with => "Example Name"
					fill_in "Email",        :with => "user@example.com"
					fill_in "Password",     :with => "foobar666"
					fill_in "Confirmation", :with => "foobar666"
					click_button
					#response.should have_selector("div.flash.success",
                                        #:content => "Welcome")
					#response.should render_template('users/show')
				end.should change(User, :count).by(1)
			end
		end
	end
end