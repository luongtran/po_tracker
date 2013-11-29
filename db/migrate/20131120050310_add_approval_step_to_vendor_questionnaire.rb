class AddApprovalStepToVendorQuestionnaire < ActiveRecord::Migration
  def change
    rename_column :vendor_questionnaires, :approval_status, :approval_step
    add_column :vendor_questionnaires, :approval_status, :string
  end
end
