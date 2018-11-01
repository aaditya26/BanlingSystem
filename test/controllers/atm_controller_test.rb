require 'test_helper'

class AtmControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get atm_index_url
    assert_response :success
  end

end
