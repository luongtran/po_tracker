class VendorQuestionApprovalStatus < ActiveRecord::Base
  attr_accessible :approval_status, :question_id, :vendor_questionnaire_group_id
  belongs_to :question
  belongs_to :vendor_questionnaire_group
  validates_uniqueness_of :question_id, scope: :vendor_questionnaire_group_id
end
