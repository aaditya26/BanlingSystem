require 'test_helper'

class BankControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bank_index_url
    assert_response :success
  end

end
