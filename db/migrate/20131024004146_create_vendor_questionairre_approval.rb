class CreateVendorQuestionairreApproval < ActiveRecord::Migration
  def change
    create_table(:vendor_questionairre_approvals, :id => false) do |t|
      t.references :vendor
      t.references :questionairre_item
    end
    
    rename_column :vendor_questionairres, :questionairre_items_id, :questionairre_item_id
  end
end
