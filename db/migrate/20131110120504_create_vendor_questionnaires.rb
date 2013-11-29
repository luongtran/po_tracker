class CreateVendorQuestionnaires < ActiveRecord::Migration
  def change
    create_table :vendor_questionnaires do |t|
      t.integer :vendor_id
      t.integer :questionnaire_id
      t.integer :approval_status_id

      t.timestamps
    end
  end
end
