class VendorQuestionnaire < ActiveRecord::Base
  attr_accessible :approval_status, :questionnaire_id, :vendor_id ,:access_key, :vendor_answer,:employee_id
  belongs_to :vendor
  belongs_to :questionnaire
  has_many :vendor_questionnaire_answers
  has_many :vendor_questionnaire_groups
  has_many :signatures
  belongs_to :employee
  after_create :send_new_questionnaire_email
  
  def send_new_questionnaire_email
    self.update_attributes(access_key: self.vendor.access_key)
    RequestMailer.send_questionnaire(self).deliver
  end
  
  def send_for_approver
    RequestMailer.requests_for_approver(self).deliver
  end
  
  private

  def set_access_key
    self.access_key = Digest::SHA1.hexdigest('--' + self.id.to_s + '--' + Time.now.to_s + '--')
  end
end
