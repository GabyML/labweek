require 'sinatra/base'
require './data_mapper_setup'

class QueOnda < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/' do
    user = User.create(email: params[:email], username: params[:username], password: params[:password], password_confirm: params[:password_confirm])
    "Welcome #{user.username}"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
