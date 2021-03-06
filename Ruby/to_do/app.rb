require 'sinatra'
require 'sinatra/reloader'
require './lib/task'
require './lib/list'
require 'pg'
require 'pry'

DB = PG.connect({:dbname => "to_do"})

also_reload('lib/**/*.rb')

get("/") do
  @list = List.new({:name => "Stuff", :id => 1})
  @tasks = Task.all()
  erb(:index)
end

get "/tasks" do
  erb(:index)
end

post("/tasks/new") do
  description = params.fetch("description")
  due_date = params.fetch("due_date")
  list_id = 1
  task = Task.new({:description => description, :due_date => due_date, :list_id => list_id})
  task.save()
  erb(:success)
end
