class UsersController < ApplicationController
  def index
    @title = "Home"
    #@user = User.find(params[:email, :password])
  end

  def new
    @title = "Sign Up"
  end

  def create
    
  end

  def edit
    @title = "Edit"
  end

  def update
    
  end

  def show
    @title = "View"
    
  end

end
