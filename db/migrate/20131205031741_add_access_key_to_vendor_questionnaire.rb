class AddAccessKeyToVendorQuestionnaire < ActiveRecord::Migration
  def change
    add_column :vendor_questionnaires, :access_key, :string
  end
end
