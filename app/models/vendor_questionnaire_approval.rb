class VendorQuestionnaireApproval < ActiveRecord::Base
  attr_accessible :approval_status, :approver, :comment, :signature_id, :vendor_questionnaire_id, :approval_step
  
  belongs_to :vendor_questionnaire
  belongs_to :employee
  belongs_to :signature
  
end
