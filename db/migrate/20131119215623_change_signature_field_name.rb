class ChangeSignatureFieldName < ActiveRecord::Migration
  def change
    rename_column :vendor_questionnaire_approvals, :signature, :signature_id
  end
end
