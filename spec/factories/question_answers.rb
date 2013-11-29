# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question_answer do
    question_id 1
    answer "MyString"
    order 1
  end
end
