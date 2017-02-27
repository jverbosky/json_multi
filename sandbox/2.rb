require 'json'

user_info = [{"user_name"=>"Abby","user_age"=>"20","num_1"=>"2","num_2"=>"4","num_3"=>"6"}]
parsed = JSON.parse(user_info)

p parsed