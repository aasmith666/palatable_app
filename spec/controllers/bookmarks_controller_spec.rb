require 'spec_helper'

describe BookmarksController do
  render_views
  
  before(:each) do
    #
    @base_title = "pal.atab.le"
    #
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    
    it "should have the right heading" do
      get 'index'
      response.should have_selector("h1",
                        :content => @base_title + " | Home")
    end
  
   it "should have body content" do
      get 'index'
      response.body.should_not =~ /<body>\s*<\/body>/
    end
  end

  #describe "GET 'create'" do
  #  it "should be successful" do
  #    get 'create'
  #    response.should be_success
   # end
    
  #  it "should have the right heading" do
  #    get 'create'
   #   response.should have_selector("h1",
   #                     :content => @base_title + " | Create New Bookmark")
   # end
 # end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
    it "should have the right heading" do
      get 'new'
      response.should have_selector("h1",
                        :content => @base_title + " | Add Bookmark")
    end
  end

  #describe "GET 'show'" do
  #  it "should be successful" do
   #   get 'show'
    #  response.should be_success
   # end
   # it "should have the right heading" do
    #  get 'show'
     # response.should have_selector("h1",
                     #   :content => @base_title + " | View All Bookmarks")
  #  end
 # end

 # describe "GET 'update'" do
 #   it "should be successful" do
  #    get 'update'
  #    response.should be_success
  #  end
    
   # it "should have the right heading" do
   #   get 'update'
   #   response.should have_selector("h1",
    #                    :content => @base_title + " | Update Bookmark")
   # end
 # end

#  describe "GET 'edit'" do
#    it "should be successful" do
#      get 'edit'
 #     response.should be_success
#    end
    
 #   it "should have the right heading" do
  #    get 'edit'
 #     response.should have_selector("h1",
  #                      :content => @base_title + " | Edit Bookmark")
  #  end
 # end

#  describe "GET 'destroy'" do
  #  it "should be successful" do
  #    get 'destroy'
  #    response.should be_success
  #  end
   # it "should have the right heading" do
   #   get 'destroy'
   #   response.should have_selector("h1",
    #                    :content => @base_title + " | Delete Bookmark")
   # end
#  end
end
