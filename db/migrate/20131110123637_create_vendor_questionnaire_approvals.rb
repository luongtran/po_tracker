class CreateVendorQuestionnaireApprovals < ActiveRecord::Migration
  def change
    create_table :vendor_questionnaire_approvals do |t|
      t.integer :vendor_questionnaire_id
      t.integer :approver
      t.integer :signature
      t.text :approval_status
      t.text :comment

      t.timestamps
    end
  end
end
