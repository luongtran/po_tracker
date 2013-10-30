class ChangeColumnInventoryItems < ActiveRecord::Migration
  def up
    change_column :inventory_items, :high_level, :integer
    change_column :inventory_items, :low_level, :integer
    change_column :inventory_items, :target_level, :integer
    change_column :inventory_items, :reordered_qty, :integer
  end

  def down
  end
end
