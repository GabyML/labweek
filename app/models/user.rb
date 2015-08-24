require 'data_mapper'
require 'bcrypt'

class User

	include DataMapper::Resource

	property :id, Serial
	property :email, String
	property :username, String
	property :password, String
	property :password_confirm, String

	validates_confirmation_of :password
	# validates_presence_of :password



end