class BookmarksController < ApplicationController
  def index
    @title = "Home"
    @bookmarks = Bookmark.all
	#@bookmarks = Bookmark.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bookmarks }
    end
  end

  def create
    @title = "Create"
	@bookmark = Bookmark.new(params[:bookmark])
    @bookmark.user_id = current_user.id

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to(@bookmark, :notice => 'Bookmark was successfully created.') }
        format.xml  { render :xml => @bookmark, :status => :created, :location => @bookmark }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bookmark.errors, :status => :unprocessable_entity }
      end
    end
  end

  def new
    @title = "New"
    @bookmark = Bookmark.new(params[:bookmark])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bookmark }
    end
  end

  def show
    @title = "View"
    @bookmark = Bookmark.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bookmark }
    end
  end

  def update
    @title = "Update"
    @bookmark = Bookmark.find(params[:id])

    respond_to do |format|
      if @bookmark.update_attributes(params[:bookmark])
        format.html { redirect_to(@bookmark, :notice => 'Bookmark was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bookmark.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @title = "Edit"
    @bookmark = Bookmark.find(params[:id])
  end

  def destroy
    @title = "Delete"
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    respond_to do |format|
      #format.html { redirect_to(bookmarks_url) }
	  format.html { redirect_to(current_user) }
      format.xml  { head :ok }
    end
   end
 end

