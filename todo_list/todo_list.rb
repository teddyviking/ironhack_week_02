require 'sinatra'
require "sinatra/reloader" if development?
require 'pry'
require 'JSON'
require_relative ("./lib/task")
require_relative ("./lib/memory_administrator")

enable :sessions
memory_administrator = MemoryAdministrator.new
tasks = memory_administrator.tasks

get '/' do
	@tasks = tasks.select{|k,v| v}
	binding.pry
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