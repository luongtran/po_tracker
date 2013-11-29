class AddQuestionnaireIdToVendorQuestionnaireAnswer < ActiveRecord::Migration
  def change
    #add_column :vendor_questionnaire_answers, :questionnaire_id, :integer
    rename_column :vendor_questionnaire_answers, :questionnaires_question_id, :question_id
    
  end
end
