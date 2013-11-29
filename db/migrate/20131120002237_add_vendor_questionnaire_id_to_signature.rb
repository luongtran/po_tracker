class AddVendorQuestionnaireIdToSignature < ActiveRecord::Migration
  def change
    add_column :signatures, :vendor_questionnaire_id, :integer
  end
end
