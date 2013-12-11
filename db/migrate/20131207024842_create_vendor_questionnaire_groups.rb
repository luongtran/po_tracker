class CreateVendorQuestionnaireGroups < ActiveRecord::Migration
  def change
    create_table :vendor_questionnaire_groups do |t|
      t.string :approval_status
      t.integer :questionnaire_group_id      
      t.timestamps
    end
    rename_column :questionnaires_questions , :questionnaire_id ,:questionnaire_group_id
  end
end
