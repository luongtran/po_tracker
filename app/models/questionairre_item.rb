class QuestionairreItem < ActiveRecord::Base
  attr_accessible :order, :question, :type
  
  has_many :vendor_answers
  has_and_belongs_to_many :vendors, :join_table => "vendor_questionairres"
  
end
