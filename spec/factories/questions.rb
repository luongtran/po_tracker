# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    question "MyString"
    question_type "MyString"
    active false
  end
end
