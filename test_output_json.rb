# Notes
# 1) A /public subdirectory must exist in order for assertions 1 - 5 to pass
# 2) Be sure to delete the /public/user.json file before running tests or test data will append and assert_equal will fail
# 3) Since the tests create, write to and read from the json file, tests 1, 2, 3 & 4 must be run in order to validate data

require "minitest/autorun"
require_relative "output_json.rb"

class TestOutputJSON < Minitest::Test
  i_suck_and_my_tests_are_order_dependent!  # this forces the assertions to run in order, only vital for 1 - 4

  def test_1_verify_data_output_to_new_json_file
    user_hash = {"user_name"=>"Abby","user_age"=>"20","num_1"=>"2","num_2"=>"4","num_3"=>"6"}
    write_json(user_hash)
    result = read_json()
    assert_equal([{"user_name"=>"Abby","user_age"=>"20","num_1"=>"2","num_2"=>"4","num_3"=>"6"}], result)
  end

  def test_2_verify_data_appended_to_existing_json_file
    user_hash = {"user_name"=>"Bobby","user_age"=>"30","num_1"=>"3","num_2"=>"6","num_3"=>"9"}
    write_json(user_hash)
    result = read_json()
    updated_hash = [{"user_name"=>"Abby","user_age"=>"20","num_1"=>"2","num_2"=>"4","num_3"=>"6"},{"user_name"=>"Bobby","user_age"=>"30","num_1"=>"3","num_2"=>"6","num_3"=>"9"}]
    assert_equal(updated_hash, result)
  end

  def test_3_verify_arry_of_names_returned_from_json
    result = get_names()
    assert_equal(["Abby", "Bobby"], result)
  end

  def test_4_verify_personal_details_hash_for_specified_user_returned_from_json
    result = get_info("Bobby")
    assert_equal({"user_name"=>"Bobby","user_age"=>"30","num_1"=>"3","num_2"=>"6","num_3"=>"9"}, result)
  end

  def test_5_verify_warning_if_name_already_in_json_file
    user_hash = {"user_name"=>"Abby","user_age"=>"40","num_1"=>"4","num_2"=>"8","num_3"=>"12"}
    result = check_values(user_hash)
    assert_equal("We already have details for that person - please enter a different person.", result)
  end

  def test_6_verify_warning_if_age_is_infeasible
    user_hash = {"user_name"=>"Cassie","user_age"=>"400","num_1"=>"4","num_2"=>"8","num_3"=>"12"}
    result = check_values(user_hash)
    assert_equal("I don't think you're really that old - please try again.", result)
  end

  def test_7_verify_warning_if_value_exceeds_20_characters
    user_hash = {"user_name"=>"Cassie Is My Name And I Put It Here","user_age"=>"40","num_1"=>"4","num_2"=>"8","num_3"=>"12"}
    result = check_values(user_hash)
    assert_equal("The value for 'user_name' is too long - please try again with a shorter value.", result)
  end

  def test_8_verify_warning_if_name_contains_non_alpha_characters
    user_hash = {"user_name"=>"Cass1e","user_age"=>"40","num_1"=>"4","num_2"=>"8","num_3"=>"12"}
    result = check_values(user_hash)
    assert_equal("Your name should only contain letters - please try again.", result)
  end

  def test_9_verify_warning_if_age_contains_non_numeric_characters
    user_hash = {"user_name"=>"Cassie","user_age"=>"40 years old","num_1"=>"4","num_2"=>"8","num_3"=>"12"}
    result = check_values(user_hash)
    assert_equal("The value for 'user_age' should only have numbers - please try again.", result)
  end

  def test_10_verify_sorted_names_rotated_properly_for_column_population
    users = ["Abby", "Bobby", "Danny", "Eddie", "Lily", "Ollie", "Penny"]
    result = rotate_names(users)
    assert_equal(["Abby", "Eddie", "Penny", "Bobby", "Lily", "", "Danny", "Ollie", ""], result)
  end

  def test_11_verify_sum_of_three_numbers
    num_1 = 15
    num_2 = 20
    num_3 = 25
    result = sum(num_1, num_2, num_3)
    assert_equal(60, result)
  end

  def test_12_verify_if_sum_less_than_age
    sum = 10
    age = 30
    result = compare(sum, age)
    assert_equal("less", result)
  end

  def test_13_verify_if_sum_more_than_age
    sum = 50
    age = 30
    result = compare(sum, age)
    assert_equal("greater", result)
  end

end