# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact_basis, :class => 'Contact::Base' do
    name "MyString"
    value "MyString"
  end
end
