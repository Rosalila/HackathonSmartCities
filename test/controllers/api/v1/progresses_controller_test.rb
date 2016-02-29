require 'test_helper'

class ProgressesControllerTest < ActionController::TestCase
  setup do
    user = create :user
    course = create :course
  end

  test "should post save" do
    post :save, achievement: { user_id: user.id, course_id: course.id }
    assert_response 200
  end

  test "should post for status" do
    post :status, achievement: { user_id: user.id, course_id: course.id }
    assert_response 200
  end
end
