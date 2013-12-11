class VendorQuestionnaireGroup < ActiveRecord::Base
  attr_accessible :questionnaire_group_id,:vendor_questionnaire_id, :approver_id
  belongs_to :questionnaire_group
  has_many :questions ,:through => :questionnaire_group
  belongs_to :vendor_questionnaire
  has_many :vendor_questionnaire_approvals
  belongs_to :employee, :foreign_key => :approver_id
  has_one :signature
  has_many :vendor_question_approval_statuses
  after_create :add_vendor_question_approval_status
  
  def employee_name
    self.employee.full_name
  end
  
  def approver_email
    self.employee.email
  end
  
  def questions_approval_status(question_id)
    self.vendor_question_approval_statuses.find(:first,:conditions => {question_id: question_id})
  end
  def add_vendor_question_approval_status
    self.questions.each{|e| self.vendor_question_approval_statuses.new(question_id: e.id).save}
  end
  
  def need_answer_again
    self.vendor_questionnaire_approvals.length > 0 && self.vendor_questionnaire_approvals.last.approval_status == "rejected"
  end  
end
