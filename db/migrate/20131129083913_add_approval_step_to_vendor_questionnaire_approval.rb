class AddApprovalStepToVendorQuestionnaireApproval < ActiveRecord::Migration
  def change
    add_column :vendor_questionnaire_approvals, :approval_step, :integer
  end
end
