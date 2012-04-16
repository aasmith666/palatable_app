class Bookmark < ActiveRecord::Base
	belongs_to :user
	
	attr_accessible :url, :name

	#Add Validation
	validates_presence_of :url #, :length => { :minimum => 10 }
	validates_length_of :url, :minimum => 10
	validates_presence_of :name #, :length => { :maximum => 100 }
	validates_length_of :name, :maximum => 100

end


# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer         not null, primary key
#  url        :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

