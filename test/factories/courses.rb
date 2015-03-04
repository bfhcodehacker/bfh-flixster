FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "test#{n}@test.com"
    end
    password "this_test!"
    password_confirmation "this_test!"
  end
end

FactoryGirl.define do 
  factory :course do 
    title "it is just a title"
    description "really just a title"
    cost "3.33"
    association :user
  end
end
