require 'data_mapper'
require 'bcrypt'

class User

	include DataMapper::Resource

	attr_reader :password
	attr_accessor :password_confirmation

	property :id, Serial
	property :email, String, required: true
	property :username, String, required: true
	property :password_digest, Text
	# property :password, String
	# property :password_confirm, String

	validates_confirmation_of :password
    validates_uniqueness_of :username
    validates_uniqueness_of :email
	validates_presence_of :password

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
