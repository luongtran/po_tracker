class QuestionnaireGroup < ActiveRecord::Base
  attr_accessible :approver_id, :questionnaire_id
  has_many :questionnaires_questions
  has_many :questions, :through => :questionnaires_questions
  has_many :vendor_questionnaire_groups
  belongs_to :questionnaire
end
