require 'sinatra/base'
require 'sinatra/flash'
require './data_mapper_setup'

class QueOnda < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'instagram for music'
  use Rack::MethodOverride


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
    user = User.create(email: params[:email], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      erb :index
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'/users/new'
    end
  end


  delete '/' do
    session[:user_id] = nil
    flash[:notice] = "Bye, loser"
  end

  post '/sessions/new' do
    user = User.authenticate(params[:return_username], params[:return_password])
      if user
        session[:user_id] = user.id
      else
        flash[:errors] = ["The username or password is incorrect!!!!!!!"]
      end
        redirect '/'
    end

  post '/onda/new' do
    onda = Onda.create(link: params[:link], message: params[:message])
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
