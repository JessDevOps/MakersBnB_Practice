require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/requests.rb'
require_relative 'lib/space.rb'
require_relative 'lib/user.rb'

class MakersBnB < Sinatra::Base

  enable :sessions

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
    erb :"login"
  end
  
  post '/login_user' do
    user = User.authenticate(email: params[:email], password: params[:password])

    # result = connection.exec(
    # "SELECT * FROM user_information WHERE email = '#{email}'",
    # [params[:email]]
    # )
    # user = User.new(id: result[0]['id'], email: result[0]['email'], password: result[0]['password'])

    session[:user_id] = user.id
    redirect('/spaces')
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

  get '/requests' do
    @request = Request.all_list
    erb :requests
  end

  get '/requests/new' do
    erb :new_request
  end

 


  
  run! if app_file == $0
end