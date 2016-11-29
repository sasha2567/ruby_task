require 'test_helper'

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  #include Devise::Test::ControllerHelpers

  test "should get show" do
    get '/payments/show'
    assert_response :redirect
  end

  
end
