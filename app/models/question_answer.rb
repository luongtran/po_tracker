class QuestionAnswer < ActiveRecord::Base
  attr_accessible :answer, :position, :question_id
  
  belongs_to :question
  
  has_many :vendor_questionnaire_answers
  
  scope :orders, -> { order('position') }
  
end
