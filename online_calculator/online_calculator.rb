require 'sinatra'
require "sinatra/reloader" if development?
require 'pry'
require_relative ('./lib/calculator')
require_relative ('./lib/memory_administrator')

get '/' do
	erb :calculator
end

post '/operation' do
	get_params
	@result = make_calculation
	erb :result
end

get '/counting' do
	@count_down = (1..200)
	erb :counting
end

get '/memory' do
	@prev_number = retrieve_memory
	erb :memory
end

post '/memory_operation' do
	get_params
	@num1 = retrieve_memory
	@result = make_calculation
	store_in_memory
	redirect to('/memory')
end

private

def get_params
	@num1 = params["num1"].to_i
	@num2 = params["num2"].to_i
	@operation = params["operation"]
end

def make_calculation
	Calculator.new.select_operation(@num1, @num2, @operation)
end

def retrieve_memory
	MemoryAdministrator.new.retrieve_number('./lib/memory.txt').to_i
end

def store_in_memory
	MemoryAdministrator.new.store_number('./lib/memory.txt', @result)
end