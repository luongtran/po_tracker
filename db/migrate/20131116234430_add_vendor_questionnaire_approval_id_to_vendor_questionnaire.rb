class AddVendorQuestionnaireApprovalIdToVendorQuestionnaire < ActiveRecord::Migration
  def change
    add_column :vendor_questionnaires, :vendor_questionnaire_approval_id, :integer
    rename_column :vendor_questionnaires, :approval_status_id, :approval_status
  end
end
