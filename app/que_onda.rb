require 'sinatra/base'
require 'sinatra/flash'
require './data_mapper_setup'
require 'byebug'
require './app/helper/sessionHelper'

class QueOnda < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'instagram for music'
  use Rack::MethodOverride
  include SessionHelpers


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
    redirect '/'
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
    if current_user == nil
      flash[:errors] = ["You must be logged in to post an Onda"]
    else
      user = current_user
      onda = Onda.new(link: params[:link], message: params[:message], user_id: user.id)
      tags = params[:tag].split(" ")
      tags.each do |tag|
        tag = Tag.create(name: tag)
        onda.tags << tag
      end
      onda.save
    end
    redirect '/'
  end

  get "/users/request_password_reset" do
      erb :'/users/request_password_reset'
  end

  post '/password_reset_request' do
    flash[:notice] = "Check #{params[:email]}"
    user = User.first(email: params[:email])
    user.update(password_token: token_generator)
    redirect '/'
  end

  get '/users/confirm_password_reset/:token' do
    session[:token] = params[:token]
    erb :'users/confirm_password_reset'
  end

  post '/password_reset' do
    user = User.first(password_token: session[:token])
    user.update(password: params[:new_password], password_confirmation: params[:new_password_confirmation], password_token: nil)
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
