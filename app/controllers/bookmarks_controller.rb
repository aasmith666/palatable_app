class BookmarksController < ApplicationController
  def index
    @title = "Home"
  end

  def create
    @title = "Create"
  end

  def new
    @title = "New"
  end

  def show
    @title = "View"
  end

  def update
    @title = "Update"
  end

  def edit
    @title = "Edit"
  end

  def destroy
    @title = "Delete"
  end

end
