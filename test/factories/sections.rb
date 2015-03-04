FactoryGirl.define do

  factory :section do
    title "Step 1"
    association :course, factory: :user         
  end

end
