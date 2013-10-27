class AddCertifiedUntilToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :certified_until, :date
  end
end
