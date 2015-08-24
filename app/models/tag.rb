require 'data_mapper'

class Tag

	include DataMapper::Resource

	property :id, Serial
	property :name, String

	has n, :ondas, through: Resource

end
