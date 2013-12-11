# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vendor_question_approval_status do
    vendor_questionnaire_group_id 1
    question_id 1
    approval_status "MyString"
  end
end
