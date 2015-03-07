require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase
  test 'create' do
    user = FactoryGirl.create(:user)
    sign_in user
    course = FactoryGirl.create(:course, :user => user)
    section = FactoryGirl.create(:section, :course => course)
    assert_difference 'section.lessons.count' do
      post :create, {:section_id => section.id, :lesson => {
        :title => "wow it's orange",
        :subtitle => "not black"
        }
      }
    end

    assert_redirected_to instructor_course_path(section.course)
    assert_equal 1, user.courses.count
  end

  test 'create not signed in' do
    user = FactoryGirl.create(:user)
    sign_in user
    course = FactoryGirl.create(:course, :user => user)
    section = FactoryGirl.create(:section, :course => course)
    sign_out user
    assert_no_difference 'section.lessons.count' do
      post :create, {:section_id => section.id, :lesson => {
        :title => "wow it's orange",
        :subtitle => "not black"
        }
      }
    end

    assert_redirected_to new_user_session_path
  end

  test 'create not valid' do
    user = FactoryGirl.create(:user)
    sign_in user
    course = FactoryGirl.create(:course, :user => user)
    section = FactoryGirl.create(:section, :course => course)
    assert_no_difference 'section.lessons.count' do
      post :create, {:section_id => section.id, :lesson => {
        :title => ' ', 
        :subtitle => ' '
        }
      }
    end
    assert_equal 0, section.lessons.count
    assert_response :unprocessable_entity
  end

end
