require 'sinatra'
require "sinatra/reloader" if development?
require 'artii'
require 'pry'

get '/ascii/:text' do
	a = Artii::Base.new :font => 'slant'
	'<pre>' + a.asciify(params[:text]) + '</pre>'
	
end

