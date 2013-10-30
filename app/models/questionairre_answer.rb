class QuestionairreAnswer < ActiveRecord::Base
  attr_accessible :answer_text,
                  :answer_yes_or_no_expect,
                  :answer_multi_choice_label, :answer_multi_choice_expect,
                  :answer_single_choice_label, :answer_single_choice_expect,
                  :questionairre_item_id
  belongs_to :questionairre_item
end
