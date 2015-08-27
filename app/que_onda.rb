require 'sinatra/base'
require 'sinatra/flash'
require './data_mapper_setup'
require 'byebug'
require './app/helper/sessionHelper'
require 'mailgun'
require 'sinatra/partial'
require_relative 'models/email_handler'

class QueOnda < Sinatra::Base
  mg_client = Mailgun::Client.new "key-99d039c5b7fb15d2daf788798677fa15"
  register Sinatra::Flash
  register Sinatra::Partial
  enable :sessions
  set :session_secret, 'instagram for music'
  set :partial_template_engine, :erb
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
    user = User.create(email: params[:email], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation], bio: params[:bio])
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
      onda = Onda.new(link: params[:link], artist: params[:artist], song: params[:song], message: params[:message], user_id: user.id)
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
    email_handler = EmailHandler.new(user, mg_client)
    # email_handler.call
    email_handler.send_something
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

  get '/users/:username' do
    @user = User.first(username: params[:username])
    @ondas = @user ? @user.ondas : []
    erb :'/users/profile'
  end

  get '/onda/:name' do
    tag = Tag.all(name: params[:name])
    @ondas = tag ? tag.ondas : []
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
