require 'sinatra'
require "sinatra/reloader" if development?
require 'pry'
require_relative ('./lib/calculator')

get '/' do
	erb :calculator
end

post '/operation' do
	@num1 = params["num1"].to_i
	@num2 = params["num2"].to_i
	@operation = params["operation"]
	@result = Calculator.new.select_operation(@num1, @num2, @operation)
	erb :result
end

get '/counting' do
	@count_down = (1..200)
	erb :counting
end

