# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    title "MyString"
    body "MyString"
    replied_at "2013-11-26 14:43:07"
    excellent 1
    last_active_mark 1
  end
end
