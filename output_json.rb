require 'json'

def read_json()
  # if /public/user.json exists, read/parse its contents; otherwise set it to an empty array
  File.exist?('public/users.json') ? json = JSON.parse(File.read('public/users.json')) : json = []
end

def write_json(user_hash)
  json = read_json()
  # append user_hash array to json data (existing or empty), then write beautified data to user.json
  File.open("public/users.json","w") { |f| f.puts JSON.pretty_generate(json << user_hash) }
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