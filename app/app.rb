ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup.rb'

class Bookmark < Sinatra::Base

  enable :sessions
  set :session_secret , 'super secret'
  register Sinatra::Flash

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/signin' do
    erb :'signin'
  end

  post '/signin' do
    params[:name]
    params[:password]
  end

  get '/signup' do
    @new_user = User.new
    erb :'/signup'
  end

  post '/signup' do
    @new_user = User.create(:username => params[:username], :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
      if @new_user.save
        session[:user_id] = @new_user.id
        redirect '/links'
      else
        flash.now[:notice] = @new_user.errors.each do
          |error| error
      end
        erb :'/signup'
    end
  end


post '/add-link' do
  link = Link.new(:title => params[:title], :url => params[:url])
  all_tags = params[:tag].split(" ")
  all_tags.each do |tag|
    link.tags << Tag.first_or_create(:name => tag)
  end
  link.save
  redirect '/links'
end

get '/tags/:name' do
  tag = Tag.first(name: params[:name])
  @links = tag ? tag.links : []
  erb :'links/index'
end

helpers do
  def current_user
    @current_user || User.get(session[:user_id])
  end
end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
