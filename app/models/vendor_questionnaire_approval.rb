class VendorQuestionnaireApproval < ActiveRecord::Base
  attr_accessible :approval_status, :approver, :comment, :signature_id, :vendor_questionnaire_group_id#, :approval_step
  
  belongs_to :vendor_questionnaire_group
  belongs_to :employee ,:foreign_key => :approver
  belongs_to :signature
  
end
