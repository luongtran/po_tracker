require 'uri'
require "base64"
class Signature < ActiveRecord::Base
  
  attr_accessible :employee_id, :text, :signature_image, :sign, :vendor_questionnaire_id
  has_attached_file :signature_image
  
  belongs_to :employee
  belongs_to :vendor_questionnaire
  has_one :vendor_questionnaire_approval
  
end
