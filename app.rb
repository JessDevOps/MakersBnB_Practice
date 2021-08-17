require 'sinatra/base'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Homepage"
    erb :"homepage"
  end

  post '/newaccount' do
    erb :"homepage"
  end

  get '/login' do
    "login"
    erb :login
  end

  get '/spaces' do
    "list of spaces"
  end

  get '/spaces/new' do
    "list new space"
  end

  get '/spaces/1' do
    "select dates"
    erb :spaces_1
  end

  get '/requests' do
    "recieved requests"
    "Sent requests"
  end

  run! if app_file == $0
end