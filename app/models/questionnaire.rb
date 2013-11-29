class Questionnaire < ActiveRecord::Base
  attr_accessible :description, :title
  
  
  has_many :questionnaires_questions
  has_many :questions, :through => :questionnaires_questions
  
  has_many :vendor_questionnaires
  
end
