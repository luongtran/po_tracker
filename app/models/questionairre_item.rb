class QuestionairreItem < ActiveRecord::Base
  TYPES = %w( text yes_or_no multi_choice single_choice )
  attr_accessible :order, :question, :question_type

  has_many :vendor_answers
  has_many :questionairre_answers
  has_and_belongs_to_many :vendors, :join_table => "vendor_questionairres"
  validates_presence_of :question, :question_type

  after_create :generate_order


  protected
  def generate_order
    update_column(:order, self.id)
  end

end
