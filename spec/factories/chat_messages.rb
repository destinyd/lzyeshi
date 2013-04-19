# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chat_message do
    message "MyString"
    read_at "2013-04-19 09:23:27"
  end
end
