FactoryGirl.define do
  factory :lesson do
    title "here's a title"
    subtitle "and it's lower case"    

    association :section, factory: :user
  end
end
