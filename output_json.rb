require 'json'

def write_json(user_hash)
  # if /public/user.json exists, read/parse its contents; otherwise set it to an empty array
  File.exist?('public/user.json') ? json = JSON.parse(File.read('public/user.json')) : json = []
  # append user_hash array to json data (existing or empty), then write beautified data to user.json
  File.open("public/user.json","w") { |f| f.puts JSON.pretty_generate(json << user_hash) }
end

def read_json()
  json = JSON.parse(File.read('public/user.json'))  # read/copy the contents of the user.json file
end

