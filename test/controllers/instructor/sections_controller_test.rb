require 'test_helper'

class Instructor::SectionsControllerTest < ActionController::TestCase
  test "create section" do 
    user = FactoryGirl.create(:user)
    sign_in user
    course = FactoryGirl.create(:course, :user => user)
    assert_difference 'course.sections.count' do 
      post :create, {:course_id => course.id, :section => {
        :title => 'Flamethrowers: Good for Cooking'
        }
      }
    end

    assert_equal 1, course.sections.count
    assert_redirected_to instructor_course_path(course)
  end

  test "create section not signed in" do 
    user = FactoryGirl.create(:user)
    sign_in user
    course = FactoryGirl.create(:course)
    sign_out user
    assert_no_difference 'course.sections.count' do 
      post :create, :course_id => course.id, :section => {
        :title => 'a section'
        }
    end
    assert_redirected_to new_user_session_path
  end

  test "create section not valid" do
    user = FactoryGirl.create(:user)
    sign_in user
    course = FactoryGirl.create(:course, :user => user)
    assert_no_difference 'course.sections.count' do
      post :create, :course_id => course.id, :section => {
        :title => ''
        }
    end

    assert_response :unprocessable_entity
  end


  test "new" do 
    user = FactoryGirl.create(:user)
    sign_in user
    course = FactoryGirl.create(:course, :user => user)
    get :new, :course_id => course.id
    assert_response :success
  end

  test "new not signed" do
    user = FactoryGirl.create(:user)
    sign_in user
    course = FactoryGirl.create(:course, :user => user)
    sign_out user
    get :new, :course_id => course.id
    assert_redirected_to new_user_session_path
  end

end
