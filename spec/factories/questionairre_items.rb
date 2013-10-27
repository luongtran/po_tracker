# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :questionairre_item do
    order 1
    question "MyString"
    type ""
  end
end
