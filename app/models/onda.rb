require 'data_mapper'

class Onda

	include DataMapper::Resource

	property :id, Serial
	property :link, String
	property :message, String
	property :artist, String
	property :song, String
	property :time, DateTime
	belongs_to :user
	has n, :tags, through: Resource
end
