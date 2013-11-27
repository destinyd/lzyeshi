# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :node do
    name "MyString"
    summary "MyString"
    sort 1
    section nil
  end
end
