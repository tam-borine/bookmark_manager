require 'sinatra/base'
require_relative 'data_mapper_setup.rb'
require 'sinatra/flash'

ENV["RACK_ENV"] ||= "development"

class Bookmark < Sinatra::Base

  enable :sessions
  use Rack::MethodOverride
  register Sinatra::Flash


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  delete '/users/sign-out' do
    session.clear
    flash.keep[:notice] = "Goodbye"
    redirect '/links'
  end


  get '/users/sign-in' do
    erb :'/users/sign-in'
  end

  post '/users/sign-in' do
    authenticated_user = User.authenticate_user(params[:email], params[:password])
    if authenticated_user
      session[:user_id] = authenticated_user.id
      redirect '/links'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'/users/sign-in'
    end
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users' do
    @user = User.new(username: params[:username],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      @errors = @user.errors
      erb :'users/new'
    end
  end

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do

    erb :'links/new'
  end

  post '/links' do
    link = Link.new(:title => params[:title], :url => params[:url])
    tags = params[:tag].split(" ")
    tags.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
