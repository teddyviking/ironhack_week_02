require 'sinatra'
require "sinatra/reloader" if development?
require 'pry'
require_relative('./lib/container')

container = Container.new

get '/' do
	@songs
	erb :index
end

get '/songs/new' do
	erb :form
end

post '/songs/new' do
	@title = params["title"]
	@singer = params["singer"]
	binding.pry

end

post '/enough' do
	
end