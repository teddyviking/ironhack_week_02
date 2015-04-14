require 'sinatra'
require "sinatra/reloader" if development?
require 'pry'
require_relative ("./lib/task")

enable :sessions
tasks = {}

get '/' do
	@tasks = tasks.select{|k,v| v}
	erb :index
end

post '/add_task' do
	tasks.count
	@task = Task.new(params["text"], params["priority"], tasks.count)
	tasks[@task.id] = @task
	redirect to('/')
end

post '/check_task' do
	@tasks = tasks.select{|k,v| v}
	@task = tasks[params["task_id"].to_i]
	@task.change_state
	erb :index
end

post '/delete_task' do
	@tasks = tasks.select{|k,v| v}
	@task = tasks[params["task_id"].to_i]
	tasks[@task.id] = nil
	redirect to('/')
end