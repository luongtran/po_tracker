class CreateQuestionnairesQuestions < ActiveRecord::Migration
  def change
    create_table :questionnaires_questions do |t|
      t.integer :question_id
      t.integer :questionnaire_id

      t.timestamps
    end
  end
end
