require 'json'

def write_json(user_hash)
  File.open("public/user.json","w") do |f|  # open the user.json file in the /public directory (create if not present)
    f.write(JSON.pretty_generate(user_hash))  # add the hash to the JSON file and save it
  end
end

def append_json(user_hash)
  data_from_json = JSON[File.read('public/user.json')]  # ready/copy the contents of the user.json file
  File.open("public/user.json","w") do |f|  # open the user.json file in the /public directory
    f.write JSON.pretty_generate(data_from_json.merge(user_hash))  # combine the user.json and user_hash hashes and write to user.json
  end
end

def read_json()
  data_from_json = JSON[File.read('public/user.json')]  # read/copy the contents of the user.json file
end

# Sandbox testing:
# user_name = {"user_name" => "John"}
# user_age = {"user_age" => "41"}
# numbers = {"one" => "100"}
# more_numbers = {"two" => "200", "three" => "300"}

# write_json(user_name)  # use to create JSON file, then use append_json() to add to file
# append_json(user_age)
# append_json(numbers)
# append_json(more_numbers)

# data_from_json = JSON[File.read('public/user.json')]  # read contents of JSON file

# p data_from_json  # output contents of JSON file