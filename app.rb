require 'sinatra'
require_relative 'output_json.rb'

class PersonalDetailsJSONMultiApp < Sinatra::Base

  get "/" do
    erb :get_info
  end

  post '/post_info' do
    user_hash = params[:user]  # assign the user hash to the user_hash variable
    write_json(user_hash)  # save user_hash to a new JSON file (delete & re-create if already present)
    name = user_hash["user_name"]
    age = user_hash["user_age"]
    n1 = user_hash["num_1"]
    n2 = user_hash["num_2"]
    n3 = user_hash["num_3"]
    # "Thanks for the info, #{backend_name}. You are #{backend_age} and your favorite numbers are #{one}, #{two} and #{three}." 
    erb :get_more_info, locals: {name: name, age: age, n1: n1, n2: n2, n3: n3}
  end

  get '/list_users' do
    names = get_names()
    erb :view_users, locals: {names: names}
  end

  get '/user_info' do
    name = params[:name]
    user_hash = get_info(name)
    erb :user_info, locals: {user_hash: user_hash}
  end

end

# Ideas:
# 1) Add functionality to view existing user data (table with links?)
# 2) Check json for hash with identical values and prompt if so