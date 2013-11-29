# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vendor_questionnaire_approval do
    vendor_questionnaire_id 1
    approver 1
    signature 1
    approval_status "MyText"
    comment "MyText"
  end
end
