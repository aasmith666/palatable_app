class User < ActiveRecord::Base
	
	
	#ADD ACCESSOR - exists in the object, but not in the database
	attr_accessor	:password
	
	#PASS in the field you want into the object
	attr_accessible :username, :real_name, :email, :password, :password_confirmation
  
	#Add relationship
	#has_many :bookmarks, :dependent => :destroy
	#has_many :user_bookmarks, :foreign_key => "bookmark_id", :dependent => :destroy
	has_many :user_bookmarks#, :foreign_key => "user_id", :dependent => :destroy
	has_many :bookmarks, :through => :user_bookmarks#, :source => "bookmark_id"
	
	#Define regular expression variable for valid email address
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
	#Add Validation
	validates 	:username, 	:presence 	=> true,
				:uniqueness	=> { :case_sensitive => false }
  
	validates 	:real_name, :presence 	=> true,
				:length   	=> { :within => 2..50 }#:minimum => 2, :maximum => 50 }
  
	validates 	:email, 	:presence 	=> true,
				:format		=> { :with => email_regex },
				:uniqueness	=> { :case_sensitive => false }
  
	validates 	:password, 	:presence 	=> true,
				:length   	=> { :within => 7..40 },#:minimum => 7, :maximum => 40 },
				:confirmation 	=> true
  
	before_save :encrypt_password

  # Return true if the user's password matches the submitted password.
	def has_password?(submitted_password)
    # Compare encrypted_password with the encrypted version of
    # submitted_password.
		encrypted_password == encrypt(submitted_password)
	end
  
	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil  if user.nil?
		return user if user.has_password?(submitted_password)
	end
  
	private

		def encrypt_password
		self.salt = make_salt unless has_password?(password)
		self.encrypted_password = encrypt(password)
		end

		def encrypt(string)
			secure_hash("#{salt}--#{string}")
		end

		def make_salt
			secure_hash("#{Time.now.utc}--#{password}")
		end

		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
		end
	#end

		def self.authenticate(email, submitted_password)
			user = find_by_email(email)
			return nil  if user.nil?
			return user if user.has_password?(submitted_password)
		end

		def self.authenticate_with_salt(id, cookie_salt)
			user = find_by_id(id)
			(user && user.salt == cookie_salt) ? user : nil
		end
	
	
end



# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  username           :string(255)
#  real_name          :string(255)
#  email              :string(255)
#  password           :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean         default(FALSE)
#

