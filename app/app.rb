require 'sinatra/base'
require_relative './models/link.rb'

class Bookmark < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :index
  end

post '/add-link' do
  Link.create(:title => params[:title], :url => params[:url])
  redirect '/links'
end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
