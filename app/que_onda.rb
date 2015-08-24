require 'sinatra/base'

class QueOnda < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/' do
    
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
