FactoryGirl.define do

  factory :section do
    title "Step 1"
    association :course        
    association :user
  end

end
