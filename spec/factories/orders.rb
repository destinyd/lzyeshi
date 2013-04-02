# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    freight ""
    total ""
    goods ""
    user nil
  end
end
