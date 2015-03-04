require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
   test "index" do
     get :index
     assert_response :success
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
     get :show, :id => 'OMG'
     assert_response :not_found
   end

end
