# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bill do
    quantity 1
    total ""
    plus "MyString"
  end
end
