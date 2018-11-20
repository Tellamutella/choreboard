require 'test_helper'

class TaskSubmissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get task_submissions_create_url
    assert_response :success
  end

end
