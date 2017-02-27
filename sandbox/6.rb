require 'json'

def read_json()
  # if /public/user.json exists, read/parse its contents; otherwise set it to an empty array
  File.exist?('public/users.json') ? json = JSON.parse(File.read('public/users.json')) : json = []
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
  json.each do |user_hash|
    # p "Line 1 - name: #{name}"
    # p "Line 2 - user_hash: #{user_hash}"
    if name == user_hash["user_name"]
      info = user_hash
      p "Line 3 - info: #{info}"
      # puts "\n"
    end
  end
  return info
end

# p read_json()
p get_info("Bobby")













