class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.integer :question_id
      t.string :answer
      t.integer :order

      t.timestamps
    end
  end
end
