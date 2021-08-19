require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/space.rb'
require_relative 'lib/user.rb'

class MakersBnB < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Homepage"
    erb :"homepage"
  end

  post '/newaccount' do
    User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
    redirect ('/login')
  end

  get '/login' do
    "login"
    erb :login
  end
  
  post '/login_user' do
    result = connection.exec(
    "SELECT * FROM user_information WHERE email = $1",
    [params[:email]]
  )
    user = User.new(result[0]['id'], result[0]['email'], result[0]['password'])

  session[:user_id] = user.id
  redirect('/spaces')
  end

  get '/spaces' do
    if session[:user_id] 
      "Michaels house"
    else
      redirect ('/login')
    end
  end

  get '/spaces/new' do
    erb :new_space
  end

  post '/spaces' do
    redirect '/spaces'
  end

  get '/spaces/1' do
    "select dates"
    erb :spaces_1
  end

  get '/requests' do
    "recieved requests"
  end

  run! if app_file == $0
end