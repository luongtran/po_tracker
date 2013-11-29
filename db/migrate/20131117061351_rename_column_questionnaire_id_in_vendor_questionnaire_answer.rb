class RenameColumnQuestionnaireIdInVendorQuestionnaireAnswer < ActiveRecord::Migration
  def change
    rename_column :vendor_questionnaire_answers, :questionnaire_id, :vendor_questionnaire_id
  end
end
