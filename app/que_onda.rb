require 'sinatra/base'
require 'sinatra/flash'
require './data_mapper_setup'

class QueOnda < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'instagram for music'

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end


  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/' do
    user = User.create(email: params[:email], username: params[:username], password: params[:password], password_confirm: params[:password_confirm])
    if user.save
      session[:user_id] = user.id
      "Welcome #{user.username}"
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'/users/new'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
