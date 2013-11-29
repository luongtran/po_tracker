class VendorQuestionnaire < ActiveRecord::Base
  attr_accessible :approval_status, :questionnaire_id, :vendor_id
  
  belongs_to :vendor
  belongs_to :questionnaire
  has_many :vendor_questionnaire_approvals
  has_many :vendor_questionnaire_answers
  has_many :signatures
  
end
