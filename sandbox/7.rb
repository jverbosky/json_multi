require 'json'

def read_json()
  # if /public/user.json exists, read/parse its contents; otherwise set it to an empty array
  File.exist?('public/users.json') ? json = JSON.parse(File.read('public/users.json')) : json = []
end

def check_values(user_hash)
  json = read_json()
  flag = 0
  feedback = ""
  json.each { |users| users.each { |key, value| flag = 1 if value == user_hash["user_name"] } }
  feedback = flag > 0 ? "We already have details for that person." : ""
end

def write_json(user_hash)
  json = read_json()
  feedback = check_values(user_hash)
  # append user_hash array to json data (existing or empty), then write beautified data to user.json
  File.open("public/users.json","w") { |f| f.puts JSON.pretty_generate(json << user_hash) } if feedback == ""
  return feedback
end

def get_names()
  names = []
  json = read_json()
  json.each { |user_hash| names.push(user_hash["user_name"]) }
  return names.sort
end

def get_info(name)
  json = read_json()
  info = {}
  json.each { |user_hash| info = user_hash if name == user_hash["user_name"] }
  return info
end

p write_json({"user_name"=>"Cassy","user_age"=>"40","num_1"=>"4","num_2"=>"8","num_3"=>"12"})
p write_json({"user_name"=>"Freddy","user_age"=>"28","num_1"=>"84","num_2"=>"95","num_3"=>"106"})