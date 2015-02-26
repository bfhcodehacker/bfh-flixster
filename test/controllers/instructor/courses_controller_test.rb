require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase
   test "new not signed in" do
     get :new
     assert_redirected_to new_user_session_path
   end

   test "new" do
     user = FactoryGirl.create(:user)
     sign_in user
     get :new
     assert_response :success
   end

   test "create" do
     user = FactoryGirl.create(:user)
     sign_in user
 
     assert_difference 'Course.count' do
       post :create, {:course => {
         :title => 'shovel snow...',
         :description => 'with a flamethrower', 
         :cost => 27.95
         }
       }
     end

     assert_redirected_to instructor_course_path(Course.last)
     assert_equal 1, user.courses.count
   end

   test "show found" do 
     user = FactoryGirl.create(:user)
     sign_in user
     course = FactoryGirl.create(:course)
     get :show, :id => course.id
     assert_response :success
   end

   test "show not found" do 
     user = FactoryGirl.create(:user)
     sign_in user
     course = FactoryGirl.create(:course)
     get :show, :id => 'OMG'
     assert_response :not_found
   end

end
