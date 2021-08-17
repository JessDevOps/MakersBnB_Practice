require 'sinatra/base'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Homepage"
  end

  get '/login' do
    "login"
  end

  get '/spaces' do
    "Michaels house"
  end
  
  get '/spaces/new' do
    "list new space"
  end

  get '/spaces/1' do
    "select dates"
  end

  get '/requests' do
    "recieved requests"
  end


  run! if app_file == $0
end