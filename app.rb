ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './app/datamapper_setup.rb'

class Bookmark_manager < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    p tag
    @links = tag ? tag.links: []
    erb :links
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links' do
  link = Link.new(url: params[:url],     # 1. Create a link
                title: params[:title])
  tag  = Tag.first_or_create(name: params[:tags])  # 2. Create a tag for the link
  link.tags << tag                       # 3. Adding the tag to the link's DataMapper collection.
  link.save
  redirect to('/links')
end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
