require 'test_helper'

class Api::V1::ProgressesControllerTest < ActionController::TestCase
  setup do
    @user = users :one
    @course = courses :one
  end

  test "should post save" do
    post :save, format: :json, user_id: @user.id, course_id: @course.id
    assert_response 200
  end

  test "should post for status" do
    post :status, format: :json, user_id: @user.id, course_id: @course.id
    assert_response 200
  end
end
