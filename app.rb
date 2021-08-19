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
    erb :"homepage"
  end

  get '/login' do
    "login"
    erb :login
  end

  
  
  get '/spaces' do
    @space = Space.all
    p @space
    erb :spaces
  end
  
  get '/spaces/new' do
    erb :new_space
  end

  post '/spaces' do
    Space.create(name: params[:name], description: params[:description], 
    price_per_night: params[:price_per_night], date_available_from: params[:date_available_from], 
    date_available_to: params[:date_available_to])
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