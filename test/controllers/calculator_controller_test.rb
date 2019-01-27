require 'test_helper'

class CalculatorControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get calculator_show_url
    assert_response :success
  end

  test "should get new" do
    get calculator_new_url
    assert_response :success
  end

end
