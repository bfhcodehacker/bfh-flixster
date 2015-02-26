FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "test#{n}@test.com"
    end
    password "this_test!"
    password_confirmation "this_test!"
  end

  factory :course do
    title "make spaghetti in the microwave"
    description "just don't blow up the microwave"
    cost 42.00
    association :user
  end

end
