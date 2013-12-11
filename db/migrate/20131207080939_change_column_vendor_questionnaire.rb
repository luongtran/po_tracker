class ChangeColumnVendorQuestionnaire < ActiveRecord::Migration
  def up
    rename_column :vendor_questionnaire_approvals , :vendor_questionnaire_id ,:vendor_questionnaire_group_id
  end

  def down
    add_column :vendor_questionnaire_groups ,:vendor_questionnaire_id , :integer
    rename_column :vendor_questionnaire_groups ,:vendor_questionnaires_id , :vendor_questionnaire_id
    add_column :vendor_questionnaire_groups ,:approver_id , :integer
    change_column :vendor_questionnaires ,:approval_step , :boolean
    rename_column :vendor_questionnaires ,:approval_step , :vendor_answer, default: true
    add_column :signatures ,:vendor_questionnaire_group_id,:integer
  end
end
