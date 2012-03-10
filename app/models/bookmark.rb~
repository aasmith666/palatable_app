class Bookmark < ActiveRecord::Base
  attr_accessible :url, :name, :date_saved

  #Add Validation
  validates_presence_of :url #, :length => { :minimum => 10 }
  validates_length_of :url, :minimum => 10
  validates_presence_of :name #, :length => { :maximum => 100 }
  validates_length_of :name, :maximum => 100
end
