require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/que_onda_#{env}")

require './app/models/user'
require './app/models/onda'
require './app/models/tag'

DataMapper.finalize

DataMapper.auto_upgrade!
