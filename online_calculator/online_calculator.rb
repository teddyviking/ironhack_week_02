require 'sinatra'
require "sinatra/reloader" if development?
require 'pry'
require_relative ('./lib/calculator')
require_relative ('./lib/memory_administrator')
require_relative ('./lib/my_logger')

enable :sessions

get '/' do
	check_session(:calculator)
end

get '/log_in' do
	erb :log_in
end

post '/log_in' do
	log_in = [params["user"], params["password"]]
	if MyLogger.new.check_log_in(log_in)
		session[:value] = true
		redirect to('/')		
	else
		status 403
		erb :not_logged
	end
end

get '/log_out' do
	session[:value] = false
	erb :log_in
end

post '/operation' do
	@result = Calculator.new.make_operation(params)
	erb :result
end

get '/counting' do
	@count_down = (1..200)
	check_session(:counting)
end

get '/memory' do
	@prev_number = MemoryAdministrator.new.retrieve_number
	check_session(:memory)
end

post '/memory_operation' do	
	memory = MemoryAdministrator.new.retrieve_number
	@result = Calculator.new.make_operation(params, memory)
	MemoryAdministrator.new.store_number(@result)
	redirect to('/memory')
end

private

def check_session(view)
	if session[:value]
		erb view
	else
		status 403
		erb :log_in
	end
end

