require 'sinatra'
require 'sinatra/reloader'
require './lib/project'
require './lib/volunteer'
require 'pry'
require 'pg'

also_reload('lib/**/*.rb')

extend Project
extend Volunteer

DB = PG.connect({:dbname => "volunteer_tracker_test"})

get '/' do
  @volunteers = Volunteer.all
  @projects = Project.all
  erb(:index)
end

#PROJECT PATH –––––––––––––––––––––––––––––––––––––

post '/project' do
  project_name = params.fetch('project')
  Project.save(project_name)
  redirect '/' 
end

get '/project/:id' do
  project_id = params.fetch('id')
  @project_info = Project.find(project_id)[0]
  volunteers = Project.find_volunteers(project_id)
  if volunteers == []
    @volunteers = [{"name" => "none specified yet"}]
  else
    @volunteers = volunteers
  end
  erb(:project)
end

patch '/project/edit/:id' do
  project_id = params.fetch('id')
  new_name = params.fetch('new-name')
  Project.edit(new_name, project_id)
  redirect "/project/#{project_id}"
end

delete '/project/delete/:id' do
  project_id = params.fetch('id')
  Project.delete(project_id)
  redirect '/'
end 

#VOLUNTEER PATH –––––––––––––––––––––––––––––––––––

post '/volunteer' do
  volunteer_name = params.fetch('volunteer')
  Volunteer.save(volunteer_name)
  redirect '/' 
end

get '/volunteer/:id' do
  volunteer_id = params.fetch('id')
  @volunteer_info = Volunteer.find(volunteer_id)[0]
  @project_names = Project.all
  if @volunteer_info["project_id"] != nil
    @assigned_project = Project.find(@volunteer_info["project_id"])
  else
    @assigned_project = [{"name" => "none specified yet..."}]
  end
  erb(:volunteer)
end

patch '/volunteer/edit/:id' do
  volunteer_id = params.fetch('id')
  new_name = params.fetch('new-name')
  Volunteer.edit(new_name, volunteer_id)
  redirect "/volunteer/#{volunteer_id}"
end

post '/volunteer/edit/:id' do
  volunteer_id = params.fetch('id')
  project_id = params.fetch('project')
  Volunteer.add_project(volunteer_id, project_id)
  redirect "/volunteer/#{volunteer_id}"
end

delete '/volunteer/delete/:id' do
  volunteer_id = params.fetch('id')
  Volunteer.delete(volunteer_id)
  redirect '/'
end 
