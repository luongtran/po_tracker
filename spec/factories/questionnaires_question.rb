# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :questionnaires_question, :class => 'QuestionnairesQuestion' do
    question_id 1
    questionnaire_id 1
  end
end
