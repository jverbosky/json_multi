require 'json'

# Method to return the contents of JSON file
def read_json()
  # if /public/user.json exists, read/parse its contents; otherwise set it to an empty array
  File.exist?('public/users.json') ? json = JSON.parse(File.read('public/users.json')) : json = []
end

# Method to determine if value is too long or if user in current user hash is already in JSON file
def check_values(user_hash)
  json = read_json()
  flag = 0
  feedback = ""
  detail = ""
  user_hash.each do |key, value|
    flag = 2 if key == "user_age" && value.to_i > 120
    (flag = 3; detail = key) if value.length > 20
    flag = 4 if key == "user_name" && value =~ /[^a-zA-Z ]/
    (flag = 5; detail = key) if key != "user_name" && value =~ /[^0-9.,]/
  end
  json.each { |users| users.each { |key, value| flag = 1 if value == user_hash["user_name"] } }
  case flag
    when 1 then feedback = "We already have details for that person - please enter a different person."
    when 2 then feedback = "I don't think you're really that old - please try again."
    when 3 then feedback = "The value for '#{detail}' is too long - please try again with a shorter value."
    when 4 then feedback = "Your name should only contain letters - please try again."
    when 5 then feedback = "The value for '#{detail}' should only have numbers - please try again."
  end
  return feedback
end

# Method to add current user hash to JSON file
def write_json(user_hash)
  json = read_json()
  feedback = check_values(user_hash)
  # append user_hash array to json data (existing or empty), then write beautified data to user.json
  File.open("public/users.json","w") { |f| f.puts JSON.pretty_generate(json << user_hash) } if feedback == ""
end

# Method to rearrange names for (top > down) then (left > right) column population
def rotate_names(sorted)
  quotient = sorted.count/3  # baseline for number of names per column
  sorted.count % quotient > 0 ? remainder = 1 : remainder = 0  # remainder to ensure no names dropped
  max_column_count = quotient + remainder  # add quotient & remainder to get max number of names per column
  matrix = sorted.each_slice(max_column_count).to_a    # names divided into three (inner) arrays
  results = matrix[0].zip(matrix[1], matrix[2]).flatten   # names rearranged (top > bottom) then (left > right) in table
  results.each_index { |name| results[name] ||= "" }  # replace any nils (due to uneven .zip) with ""
end

# Method to return array of sorted/transposed names from JSON file for populating /list_users table
def get_names()
  names = []
  json = read_json()
  json.each { |user_hash| names.push(user_hash["user_name"]) }
  sorted = names.sort  # sort names alphabetically
  sorted = sorted.count > 3 ? rotate_names(sorted) : sorted  # rerrange names if more than 3 names, otherwise return sorted
end

# Method to return user hash from JSON file for specified user
def get_info(name)
  json = read_json()
  info = {}
  json.each { |user_hash| info = user_hash if name == user_hash["user_name"] }
  return info
end

# Method to return the sum of favorite numbers
def sum(n1, n2, n3)
  sum = n1.to_i + n2.to_i + n3.to_i
end

# Method to compare the sum of favorite numbers against the person's age
def compare(sum, age)
  comparison = (sum < age.to_i) ? "less" : "greater"
end