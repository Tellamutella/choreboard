require 'test_helper'

class ChildrenControllerTest < ActionDispatch::IntegrationTest
  test "should get playground" do
    get children_playground_url
    assert_response :success
  end

end
