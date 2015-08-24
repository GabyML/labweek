require 'sinatra/base'
require 'sinatra/flash'
require './data_mapper_setup'
require 'byebug'

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
    @ondas = Onda.all
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
    onda = Onda.new(link: params[:link], message: params[:message])
    tags = params[:tag].split(" ")
    tags.each do |tag|
      tag = Tag.create(name: tag)
      onda.tags << tag
    end
    onda.save
    byebug
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
