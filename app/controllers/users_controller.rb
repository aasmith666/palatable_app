class UsersController < ApplicationController
	def index
		@title = "Home"
		@user = User.new
	end

	def new
		@user = User.new
		@title = "Sign Up"
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "Welcome to Pal.atab.le!"
			redirect_to @user
		else
			@title = "Sign up"
			render 'new'
		end
	end
	

	def edit
		@title = "Edit"
		@user = User.find(params[:id])
	end

	def update
    
	end

	def show
		@title = "View"
		@user = User.find(params[:id])
    
	end

	def help
		@title = "Help"
	end
end
