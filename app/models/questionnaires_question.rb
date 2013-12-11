class QuestionnairesQuestion < ActiveRecord::Base
  attr_accessible :question_id, :questionnaire_group_id #change from questionnaire_id
  
  belongs_to :questionnaire_group
  belongs_to :question
  has_many :vendor_questionnaire_answers
  
end
