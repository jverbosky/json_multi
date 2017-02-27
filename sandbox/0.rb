require 'json'

# def write_json(user_hash)
#   File.open("public/user.json","w") do |f|  # open the user.json file in the /public directory (create if not present)
#     f.write(JSON.pretty_generate(user_hash))  # add the hash to the JSON file and save it
#   end
# end

# def update_json(user_hash)
#   if File.exist?('public/user.json')
#     data_from_json = File.read('public/user.json')  # ready/copy the contents of the user.json file
#   #   p data_from_json
#   # else
#   #   p "No file..."
#   end

#   # File.open("public/user.json","w") do |f|  # open the user.json file in the /public directory
#   #   f.puts JSON.pretty_generate(JSON.parse(data_from_json) << user_hash)  # combine the user.json and user_hash hashes and write to user.json
#   # end
# end

# def read_json()
#   data_from_json = JSON[File.read('public/user.json')]  # read/copy the contents of the user.json file
# end

# def update_json2(user_hash)
#   data_from_json = JSON.parse(File.read('public/user.json'))
#   p data_from_json
#   data_from_json << user_hash
#   p data_from_json
#   data_from_json.to_json
#   p data_from_json
# end

# def update_json3(user_hash)
#   if File.exist?('public/user.json')
#     json = JSON.parse(File.read('public/user.json'))
#   else
#     json = []
#   end
#   File.open("public/user.json","w") do |f|
#     f.puts JSON.pretty_generate(json << user_hash)
#   end
# end

def write_json(user_hash)
  File.exist?('public/user.json') ? json = JSON.parse(File.read('public/user.json')) : json = []
  File.open("public/user.json","w") { |f| f.puts JSON.pretty_generate(json << user_hash) }
end

# Sandbox testing:
# write_json({"user_name"=>"Abby","user_age"=>"20","num_1"=>"2","num_2"=>"4","num_3"=>"6"})
# update_json3({"user_name"=>"Bobby","user_age"=>"30","num_1"=>"3","num_2"=>"6","num_3"=>"9"})
write_json({"user_name"=>"Cassy","user_age"=>"40","num_1"=>"4","num_2"=>"8","num_3"=>"12"})
# write_json({"user_name"=>"Danny","user_age"=>"50","num_1"=>"5","num_2"=>"10","num_3"=>"15"})