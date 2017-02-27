require 'json'

# Method to return the contents of JSON file
def read_json()
  # if /public/user.json exists, read/parse its contents; otherwise set it to an empty array
  File.exist?('public/users.json') ? json = JSON.parse(File.read('public/users.json')) : json = []
end

# Method to determine if user in current user hash is already in JSON file
def check_values(user_hash)
  json = read_json()
  flag = 0
  feedback = ""
  json.each { |users| users.each { |key, value| flag = 1 if value == user_hash["user_name"] } }
  feedback = flag > 0 ? "We already have details for that person - please enter a different person." : ""
end

# Method to add current user hash to JSON file
def write_json(user_hash)
  json = read_json()
  feedback = check_values(user_hash)
  # append user_hash array to json data (existing or empty), then write beautified data to user.json
  File.open("public/users.json","w") { |f| f.puts JSON.pretty_generate(json << user_hash) } if feedback == ""
end

# Method to return array of names from JSON file
def get_names()
  names = []
  json = read_json()
  json.each { |user_hash| names.push(user_hash["user_name"]) }
  return names.sort
end

# Method to return user hash from JSON file for specified user
def get_info(name)
  json = read_json()
  info = {}
  json.each { |user_hash| info = user_hash if name == user_hash["user_name"] }
  return info
end