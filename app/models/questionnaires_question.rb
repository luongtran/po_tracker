class QuestionnairesQuestion < ActiveRecord::Base
  attr_accessible :question_id, :questionnaire_id
  
  belongs_to :questionnaire
  belongs_to :question
  
  has_many :vendor_questionnaire_answers
  
end
