require 'test_helper'

class TaskSubmissinosControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get task_submissinos_create_url
    assert_response :success
  end

end
