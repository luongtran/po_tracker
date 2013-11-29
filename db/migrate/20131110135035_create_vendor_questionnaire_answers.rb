class CreateVendorQuestionnaireAnswers < ActiveRecord::Migration
  def change
    create_table :vendor_questionnaire_answers do |t|
      t.integer :vendor_id
      t.integer :questionnaires_question_id
      t.integer :question_answer_id
      t.text :answer

      t.timestamps
    end
  end
end
