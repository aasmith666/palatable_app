class UsersController < ApplicationController
	before_filter :authenticate, :only => [:edit, :update]
	before_filter :correct_user, :only => [:edit, :update]
	
	def index
		@current_user = User.find(params[:id])
		#@user = User.all
		@title = @user.username
	end
	
	def new
		@user = User.new
		@title = "Sign Up"
	end

	def create
		@user = User.create(params[:user])
		#@user = User.new(params[:user])
		if @user.save
			sign_in @user
			flash[:success] = "Welcome to Pal.atab.le!"
			redirect_to @user
		else
			@title = "Sign up"
			@user.password = nil #clears out the password field after submit fails and new form is rendered
			@user.password_confirmation = nil #ditto above
			render 'new'
		end
	end
	

	def edit
		@title = "Edit"
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:success] = "Profile updated."
			redirect_to @user
		else
			@title = "Edit"
			render 'edit'
		end
	end

	def show
		@user = User.find(params[:id])
		@title = @user.username
	end
	
	def profile
		@current_user = User.find(params[:id])
		#@title = @user.username
		@title = "Profile"
	end
	
	def help
		@title = "Help"
	end
	
	private
	
	def authenticate
      deny_access unless signed_in?
    end
	
	def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
	
end
