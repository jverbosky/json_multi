require 'json'

# user_info = [{"user_name"=>"Abby", "user_age"=>"20", "num_1"=>"2", "num_2"=>"4", "num_3"=>"6"}, {"user_name"=>"Bobby", "user_age"=>"30", "num_1"=>"3", "num_2"=>"6", "num_3"=>"9"}, {"user_name"=>"Cassy", "user_age"=>"40", "num_1"=>"4", "num_2"=>"8", "num_3"=>"12"}, {"user_name"=>"Danny", "user_age"=>"50", "num_1"=>"5", "num_2"=>"10", "num_3"=>"15"}]

def get_usernames()
  users = []
  File.exist?('public/user.json') ? json = JSON.parse(File.read('public/user.json')) : json = []
  json.each do |user_hash|
    users.push(user_hash["user_name"])
  end
  return users
end


p get_usernames()

# working on outputting usernames to populate view_info.erb
# current idea - put get_usernames() in output_json.rb, output names to array, loop through array in view_info.erb
# then can create another view (user_info) that dynamically populates info for selected user
# that's an idea, anyways...