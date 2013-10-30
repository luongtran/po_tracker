class AddParentToPipingComponents < ActiveRecord::Migration
  def self.up
    unless column_exists? :piping_components, :parent_id
      add_column :piping_components, :parent_id, :integer
    end
  end

  def self.down
  	remove_column :piping_components, :parent_id
  end
end
