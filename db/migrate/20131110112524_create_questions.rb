class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.string :question_type
      t.boolean :active

      t.timestamps
    end
  end
end
