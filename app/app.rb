<<<<<<< HEAD
ENV["RACK_ENV"] ||= "development"
=======
ENV['RACK_ENV'] ||= 'development'
>>>>>>> f018a42292ba43017d89858f5c8613c6d4d43417

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Bookmark < Sinatra::Base
<<<<<<< HEAD
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
     link.tags << Tag.create(name: tag)
   end
=======
  get '/' do
    'Hello Bookmark!'
  end

  get '/links' do
    @links = Link.all
    erb(:'links/index')
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links/created' do
    link = Link.create(:title => params[:title], :url => params[:url])
    params[:tags].split(",").each do |tag|
      final_tag = Tag.first_or_create(:name => tag.strip)
      link.tags << final_tag
    end
>>>>>>> f018a42292ba43017d89858f5c8613c6d4d43417
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
<<<<<<< HEAD
    @links = tag ? tag.links : []
    erb :'links/index'
  end


=======
    @links = (tag ? tag.links : [])
    erb(:'links/index')
  end

>>>>>>> f018a42292ba43017d89858f5c8613c6d4d43417
  # start the server if ruby file executed directly
  run! if app_file == $0
end
