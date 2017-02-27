require "minitest/autorun"

require_relative "output_json.rb"


class TestOutputJSON < Minitest::Test

  def test_1_verify_data_output_to_new_json_file
    user_name = {"user_name" => "John Doe"}
    results = write_json(user_name)
    data_from_json = JSON[File.read('public/user.json')]
    assert_equal({"user_name"=>"John Doe"}, data_from_json)
  end

  def test_2_verify_single_data_point_added_to_existing_json_file
    user_age = {"user_age" => "25"}
    results = append_json(user_age)
    data_from_json = JSON[File.read('public/user.json')]
    assert_equal({"user_name"=>"John Doe", "user_age"=>"25"}, data_from_json)
  end

  def test_3_verify_multiple_data_points_added_to_existing_json_file
    user_age = {"n1" => "10", "n2" => "20", "n3" => "30"}
    results = append_json(user_age)
    data_from_json = JSON[File.read('public/user.json')]
    assert_equal({"user_name"=>"John Doe","user_age"=>"25","n1"=>"10","n2"=>"20","n3"=>"30"}, data_from_json)
  end

end