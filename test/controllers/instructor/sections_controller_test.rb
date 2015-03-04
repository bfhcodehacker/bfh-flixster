require 'test_helper'

class Instructor::SectionsControllerTest < ActionController::TestCase
  test "add section" do 
    user = FactoryGirl.create(:user)
    sign_in user
    course = FactoryGirl.create(:course, :user => user)
    assert_difference 'course.sections.count' do 
      post :create, {:course_id => course.id, :section => {
        :title => 'Flamethrowers: Good for Cooking'
        }
      }
    end

    assert_redirected_to instructor_course_path(course)
  end

  test "add section not signed in" do 
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

#  test "show found" do 
#    user = FactoryGirl.create(:user)
#    sign_in user
#    course = FactoryGirl.create(:course, :user => user)
#    section = FactoryGirl.create(:section, :user => user, :course => course)   
    
#  end

#  test "new" do 
#    user = FactoryGirl.create(:user)
#    sign_in user
#    course = FactoryGirl.create(:course, :user => user)
#    get :new, :id => course.id
#    assert_response :success
#  end

end
