class Bookmark < ActiveRecord::Base
  validates_presence_of :url, :length => { :minimum => 10 }
  validates_presence_of :name, :length => { :maximum => 100 }
end
