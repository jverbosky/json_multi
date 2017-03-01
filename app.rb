require 'sinatra'
require_relative 'output_json.rb'

class PersonalDetailsJSONMultiApp < Sinatra::Base

  get "/" do
    feedback = ""  # placeholders in this route to avoid error message
    name = ""
    age = ""
    n1 = ""
    n2 = ""
    n3 = ""
    # feedback is used in /post_info route, passing empty string to view to avoid error message
    erb :get_info, locals: {feedback: feedback, name: name, age: age, n1: n1, n2: n2, n3: n3}
  end

  post '/post_info' do
    user_hash = params[:user]  # assign the user hash to the user_hash variable
    feedback = check_values(user_hash)  # check to see if user is already in JSON file
    write_json(user_hash)  # if not, add user info a JSON file
    name = user_hash["user_name"]  # user name from the resulting hash
    age = user_hash["user_age"]  # user age from the resulting hash
    n1 = user_hash["num_1"]  # favorite number 1 from the resulting hash
    n2 = user_hash["num_2"]  # favorite number 2 from the resulting hash
    n3 = user_hash["num_3"]  # favorite number 3 from the resulting hash
    total = sum(n1, n2, n3)
    comparison = compare(total, age)
    # test line to verify post info making it to this route:
    # "Thanks for the info, #{backend_name}. You are #{backend_age} and your favorite numbers are #{one}, #{two} and #{three}."
    # conditionally route depending on whether user name is already in JSON file or not
    if feedback == ""  # if there's no feedback on user already being in JSON, use the get_more_info view
      erb :get_more_info, locals: {name: name, age: age, n1: n1, n2: n2, n3: n3, total: total, comparison: comparison}
    else
      # otherwise reload the get_info view with feedback and user-specified values so they can correct and resubmit
      erb :get_info, locals: {feedback: feedback, name: name, age: age, n1: n1, n2: n2, n3: n3}
    end
  end

  get '/list_users' do
    names = get_names()  # get an array of all of the user names in JSON file
    erb :view_users, locals: {names: names}  # pass array to view_users view for listing
  end

  get '/user_info' do
    name = params[:name]  # get the specified name from the url in view_users.erb (url = "/user_info?name=" + name)
    user_hash = get_info(name)  # get the hash of info for the specified user
    erb :user_info, locals: {user_hash: user_hash}  # pass hash of info to user_info view for listing
  end

end