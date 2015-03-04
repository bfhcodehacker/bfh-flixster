require 'test_helper'

class LessonsControllerTest < ActionController::TestCase
   test "show found" do
     user = FactoryGirl.create(:user)
     sign_in user
     course = FactoryGirl.create(:course, :user => user)
     section = FactoryGirl.create(:section, :course => course) 
     lesson = FactoryGirl.create(:lesson, :section => section)
     get :show, :id => lesson.id
     assert_response :success
   end

   test "show not found" do
     user = FactoryGirl.create(:user)
     sign_in user
     course = FactoryGirl.create(:course, :user => user)
     section = FactoryGirl.create(:section, :course => course)
     lesson = FactoryGirl.create(:lesson, :section => section)
     get :show, :id => 'OMG'
     assert_response :not_found
   end

end
