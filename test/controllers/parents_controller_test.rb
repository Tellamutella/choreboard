require 'test_helper'

class ParentsControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get parents_dashboard_url
    assert_response :success
  end

end
