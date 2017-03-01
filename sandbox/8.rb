# names = ["Abby", "Bobby", "Danny", "Eddie", "Harry", "Katie", "Lily", "Matt", "Molly", "Ollie", "Penny", "Ruby", "Sally"]
# names = ["Abby", "Billy", "Bobby", "Danny", "Eddie", "Ginny", "Harry", "Katie", "Lily", "Matt", "Molly", "Ollie", "Penny", "Rolly", "Ruby", "Sally"]
# names = ["Matt", "Abby", "Bobby", "Danny", "Eddie", "Lily", "Ollie", "Penny", "Ruby", "Molly", "Katie", "Harry", "Wally", "Polly", "Rolly", "Billy", "Millie", "Ginny", "Nancy", "Stacey"]

# Sandbox testing
# quotient = names.count/3
# remainder = names.count % quotient
# column_items = quotient + remainder
# # names divided evenly into three arrays
# matrix = names.each_slice(column_items).to_a
# p matrix
# # names rearranged to flow (top > bottom) then (left > right) in table
# transposed = matrix[0].zip(matrix[1], matrix[2]).flatten
# p transposed

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
  names = ["Matt", "Abby", "Bobby", "Danny", "Eddie", "Lily", "Ollie", "Penny", "Ruby", "Molly", "Katie", "Harry", "Wally", "Polly", "Rolly", "Billy", "Millie", "Ginny", "Nancy"]
  # names = ["Matt", "Abby", "Bobby"]
  # names = ["Matt", "Abby"]
  # names = ["Matt"]
  # json = read_json()
  # json.each { |user_hash| names.push(user_hash["user_name"]) }
  sorted = names.sort  # sort names alphabetically
  sorted = sorted.count > 3 ? rotate_names(sorted) : sorted   # if more than 3 names, need to rearrange for desired column format
end

p get_names()

# def get_names()
#   names = ["Matt", "Abby", "Bobby", "Danny", "Eddie", "Lily", "Ollie", "Penny", "Ruby", "Molly", "Katie", "Harry", "Wally", "Polly", "Rolly", "Billy", "Millie", "Ginny", "Nancy"]
#   # names = ["Matt", "Abby", "Bobby"]
#   # names = ["Matt", "Abby"]
#   # names = ["Matt"]
#   # json = read_json()
#   # json.each { |user_hash| names.push(user_hash["user_name"]) }
#   sorted = names.sort
#   puts "Sorted names: #{sorted}"
#   if sorted.count > 3
#     quotient = sorted.count/3  # baseline for number of names per column
#     puts "Quotient: #{quotient}"
#     sorted.count % quotient > 0 ? remainder = 1 : remainder = 0  # remainder to ensure no names dropped
#     puts "Remainder: #{remainder}"
#     column_items = quotient + remainder  # add quotient & remainder to get max number of names per column
#     puts "Max number of names per column: #{column_items}"
#     matrix = sorted.each_slice(column_items).to_a  # names divided into three (inner) arrays
#     puts "Matrix of arrays: #{matrix}"
#     results = matrix[0].zip(matrix[1], matrix[2]).flatten  # names rearranged (top > bottom) then (left > right) in table
#     puts "Transposed names to use for table: #{results}"
#     results.each_index { |name| results[name] ||= "" }  # replace any nils (from .zip) with ""
#     puts "Transposed names after replace: #{results}"
#   else
#     results = sorted
#   end
#   return results
# end

# def get_names()
#   # names = ["Matt", "Abby", "Bobby", "Danny", "Eddie", "Lily", "Ollie", "Penny", "Ruby", "Molly", "Katie", "Harry", "Wally", "Polly", "Rolly", "Billy", "Millie", "Ginny", "Nancy", "Stacey"]
#   names = ["Matt", "Abby", "Bobby"]  # Transposed names after replace: ["Abby", "Bobby", "Matt"]
#   names = ["Matt", "Abby"]  #
#   # json = read_json()
#   # json.each { |user_hash| names.push(user_hash["user_name"]) }
#   sorted = names.sort
#   puts "Sorted names: #{sorted}"
#   quotient = sorted.count/3  # baseline for number of names per column
#   puts "Quotient: #{quotient}"
#   sorted.count % quotient > 0 ? remainder = 1 : remainder = 0  # remainder to ensure no names dropped
#   puts "Remainder: #{remainder}"
#   column_items = quotient + remainder  # add quotient & remainder to get max number of names per column
#   puts "Max number of names per column: #{column_items}"
#   matrix = sorted.each_slice(column_items).to_a  # names divided into three (inner) arrays
#   puts "Matrix of arrays: #{matrix}"
#   transposed_names = matrix[0].zip(matrix[1], matrix[2]).flatten  # names rearranged (top > bottom) then (left > right) in table
#   puts "Transposed names to use for table: #{transposed_names}"
#   transposed_names.each_index { |name| transposed_names[name] ||= "" }  # replace any nils (from .zip) with ""
#   puts "Transposed names after replace: #{transposed_names}"
# end


# def get_names()
#   names = []
#   json = read_json()
#   json.each { |user_hash| names.push(user_hash["user_name"]) }
#   return names.sort
# end