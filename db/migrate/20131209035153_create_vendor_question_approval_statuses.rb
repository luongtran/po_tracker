class CreateVendorQuestionApprovalStatuses < ActiveRecord::Migration
  def change
    create_table :vendor_question_approval_statuses do |t|
      t.integer :vendor_questionnaire_group_id
      t.integer :question_id
      t.string :approval_status

      t.timestamps
    end
  end
  
end
