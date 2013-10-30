class CreateQuestionairreAnswers < ActiveRecord::Migration
  def change
    create_table :questionairre_answers do |t|
      t.integer :questionairre_item_id
      t.text :answer_text # for question  text
      t.boolean :answer_yes_or_no_expect # for question yes or no

      t.string :answer_multi_choice_label #   for multichoice
      t.boolean :answer_multi_choice_expect

      t.string :answer_single_choice_label #   for single choice
      t.boolean :answer_single_choice_expect

      t.timestamps
    end
  end
end
