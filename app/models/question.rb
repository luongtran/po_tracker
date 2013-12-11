class Question < ActiveRecord::Base
  
  extend Listable::ModelHelper
  
  attr_accessible :active, :question, :question_type
  
  
  has_many :questionnaires_questions
  has_many :questionnaires, :through => :questionnaires_questions
  
  has_many :question_answers
  
  has_many :vendor_question_approval_statuss
  
  TYPES = {:list => "List", :bool => "Boolean", :multiple => "Multiple Choice", :single => "Single Choice", :text => "Text"}
  
  TYPES_ARR = ["List", "Boolean", "Text", "Multiple Choice", "Single Choice"]
  
  PERPAGE = 100
  
  scope :active_questions, -> { where(active: true) }
  
  def need_create_answers
    (question_type == Question::TYPES[:multiple]) || (question_type == Question::TYPES[:single]) 
  end
  
  def approve_status(vendor_questionnaire_groups_id)
    vendor_question_approval_status = VendorQuestionApprovalStatus.where(question_id: self.id,vendor_questionnaire_group_id: vendor_questionnaire_groups_id).last
    approver_status = vendor_question_approval_status.approval_status
    return approver_status  
  end  
end
