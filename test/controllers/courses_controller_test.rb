require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
   test "index" do
     get :index
     assert_response :success
   end
end
