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

def get_names()
  names = ["Matt", "Abby", "Bobby", "Danny", "Eddie", "Lily", "Ollie", "Penny", "Ruby", "Molly", "Katie", "Harry", "Wally", "Polly", "Rolly", "Billy", "Millie", "Ginny", "Nancy", "Stacey"]
  # json = read_json()
  # json.each { |user_hash| names.push(user_hash["user_name"]) }
  sorted = names.sort
  puts "Sorted names: #{sorted}"
  quotient = sorted.count/3  # baseline for number of names per column
  puts "Quotient: #{quotient}"
  sorted.count % quotient > 0 ? remainder = 1 : remainder = 0  # remainder to ensure no names dropped
  puts "Remainder: #{remainder}"
  column_items = quotient + remainder  # add quotient & remainder to get max number of names per column
  puts "Max number of names per column: #{column_items}"
  matrix = sorted.each_slice(column_items).to_a  # names divided into three (inner) arrays
  puts "Matrix of arrays: #{matrix}"
  transposed_names = matrix[0].zip(matrix[1], matrix[2]).flatten  # names rearranged (top > bottom) then (left > right) in table
  puts "Transposed names to use for table: #{transposed_names}"
  transposed_names.each_index { |name| transposed_names[name] ||= "" }  # replace any nils (from .zip) with ""
  puts "Transposed names after replace: #{transposed_names}"
end

get_names()



# def get_names()
#   names = []
#   json = read_json()
#   json.each { |user_hash| names.push(user_hash["user_name"]) }
#   return names.sort
# end