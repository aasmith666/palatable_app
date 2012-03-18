class User < ActiveRecord::Base
	
	has_many :bookmarks
	#ADD ACCESSOR
	attr_accessor	:password
	
	attr_accessible :username, :real_name, :email, :password, :password_confirmation
  
  #Define regular expression variable for valid email address
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  #Add Validation
  
  validates :username, 	:presence 	=> true,
			:uniqueness	=> { :case_sensitive => false }
  
  validates :real_name, :presence 	=> true,
			:length   	=> { :within => 2..50 }#:minimum => 2, :maximum => 50 }
  
  validates :email, 	:presence 	=> true,
			:format		=> { :with => email_regex },
			:uniqueness	=> { :case_sensitive => false }
  
  validates :password, 	:presence 	=> true,
			:length   	=> { :within => 7..40 },#:minimum => 7, :maximum => 40 },
			:confirmation 	=> true
  
  
  
end
