ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'bcrypt'


class Bookmark < Sinatra::Base
  get '/' do
    'Hello Bookmark!'

  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    my_password = BCrypt::Password.create(params[:password])
    @user = User.create(name: params[:name], email: params[:email], password: my_password)
    erb(:'users/index')
  end


  get '/links' do
    @links = Link.all
    erb(:'links/index')
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links/created' do
    link = Link.create(title: params[:title], url: params[:url])
    params[:tags].split(",").each do |tag|
      final_tag = Tag.first_or_create(name: tag.strip)
      link.tags << final_tag
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = (tag ? tag.links : [])
    erb(:'links/index')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
