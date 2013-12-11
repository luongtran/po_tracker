class Questionnaire < ActiveRecord::Base
  extend Listable::ModelHelper
  attr_accessible :description, :title,:completed_at
  has_many :vendor_questionnaires
  has_many :questionnaire_groups
  PERPAGE = 100
end
