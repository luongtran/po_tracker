class VendorQuestionnaireAnswer < ActiveRecord::Base
  attr_accessible :answer, :question_answer_id, :question_id, :vendor_id, :vendor_questionnaire_id
  
  belongs_to :question_answer
  belongs_to :question
  belongs_to :vendor_questionnaire
  belongs_to :vendor
end
