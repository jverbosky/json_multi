require 'sinatra'
require_relative 'output_json.rb'

class PersonalDetailsJSONMultiApp < Sinatra::Base

  get "/" do
    erb :get_info
  end

  post '/post_info' do
    user_hash = params[:user]  # assign the user hash to the user_hash variable
    write_json(user_hash)  # save user_hash to a new JSON file (delete & re-create if already present)
    name = user_hash[0]["user_name"]
    age = user_hash[0]["user_age"]
    n1 = user_hash[0]["num_1"]
    n2 = user_hash[0]["num_2"]
    n3 = user_hash[0]["num_3"]
    # "Thanks for the info, #{backend_name}. You are #{backend_age} and your favorite numbers are #{one}, #{two} and #{three}." 
    erb :get_more_info, locals: {name: name, age: age, n1: n1, n2: n2, n3: n3}
  end

  post '/post_more_info' do
    user_hash = params[:user]  # assign the user hash to the user_hash variable
    append_json(user_hash)  # save user_hash to a new JSON file (delete & re-create if already present)
    name = user_hash[-1]["user_name"]
    age = user_hash[-1]["user_age"]
    n1 = user_hash[-1]["num_1"]
    n2 = user_hash[-1]["num_2"]
    n3 = user_hash[-1]["num_3"]
    # "Thanks for the info, #{backend_name}. You are #{backend_age} and your favorite numbers are #{one}, #{two} and #{three}." 
    erb :get_more_info, locals: {name: name, age: age, n1: n1, n2: n2, n3: n3}
  end

end

# Need to work on output_json.rb > JSON data being overwritten every time, want to append
#
# Once collecting data from multiple users working, try adding dynamic table for listing data for each user in JSON
# - probably use a different route & view (get '/user_data' do)
# - iterate over usernames in each hash within array - user_hash[counter]["user_name"]