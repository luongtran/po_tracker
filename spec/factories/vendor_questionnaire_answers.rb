# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vendor_questionnaire_answer do
    vendor_id 1
    questionnaires_question_id 1
    question_answer_id 1
    answer "MyText"
  end
end
