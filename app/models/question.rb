class Question < ActiveRecord::Base
  
  extend Listable::ModelHelper
  
  attr_accessible :active, :question, :question_type
  
  
  has_many :questionnaires_questions
  has_many :questionnaires, :through => :questionnaires_questions
  
  has_many :question_answers
  
  TYPES = {:list => "List", :bool => "Boolean", :multiple => "Multiple Choice", :single => "Single Choice", :text => "Text"}
  
  TYPES_ARR = ["List", "Boolean", "Text", "Multiple Choice", "Single Choice"]
  
  PERPAGE = 100
  
  scope :active_questions, -> { where(active: true) }
  
  def need_create_answers
    (question_type == Question::TYPES[:multiple]) || (question_type == Question::TYPES[:single]) 
  end
  
end
