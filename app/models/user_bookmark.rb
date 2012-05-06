class UserBookmark < ActiveRecord::Base
	attr_accessible :bookmark_id, :user_id
	
	belongs_to :user#, :class_name => "User"
	belongs_to :bookmark#, :class_name => "Bookmark"
	#has_many :bookmarks, :through => :user_bookmarks, :source => :bookmark_id
	
	validates :user_id, :presence => true
	validates :bookmark_id, :presence => true
end

# == Schema Information
#
# Table name: user_bookmarks
#
#  id            :integer         not null, primary key
#  user_id       :integer
#  bookmark_id   :integer
#  bookmark_name :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

