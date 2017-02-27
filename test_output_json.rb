# Note - be sure to delete /public/user.json file before running tests or test data will append and assert_equal will fail

require "minitest/autorun"
require_relative "output_json.rb"

class TestOutputJSON < Minitest::Test

  def test_1_verify_data_output_to_new_json_file
    user_hash = {"user_name"=>"Abby","user_age"=>"20","num_1"=>"2","num_2"=>"4","num_3"=>"6"}
    results = write_json(user_hash)
    data_from_json = JSON.parse(File.read('public/users.json'))
    assert_equal([{"user_name"=>"Abby","user_age"=>"20","num_1"=>"2","num_2"=>"4","num_3"=>"6"}], data_from_json)
  end

  def test_2_verify_data_added_to_existing_json_file
    user_hash = {"user_name"=>"Bobby","user_age"=>"30","num_1"=>"3","num_2"=>"6","num_3"=>"9"}
    results = write_json(user_hash)
    data_from_json = JSON.parse(File.read('public/users.json'))
    updated_hash = [{"user_name"=>"Abby","user_age"=>"20","num_1"=>"2","num_2"=>"4","num_3"=>"6"},{"user_name"=>"Bobby","user_age"=>"30","num_1"=>"3","num_2"=>"6","num_3"=>"9"}]
    assert_equal(updated_hash, data_from_json)
  end

  def test_3_verify_data_added_to_existing_json_file
    user_hash = {"user_name"=>"Cassy","user_age"=>"","num_1"=>"4","num_2"=>"8","num_3"=>"12"}
    results = write_json(user_hash)
    assert_equal("You didn't specify an age - please try again", results)
  end

end