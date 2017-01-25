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
    @links = tag ? tag.links : []
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
    link = Link.new(url: params[:url], # 1. Create a link
                    title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag) # 2. Create a tag for the link
    end # 3. Adding the tag to the link's DataMapper collection.
    link.save
    redirect to('/links')
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
