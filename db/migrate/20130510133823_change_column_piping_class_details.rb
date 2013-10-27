class ChangeColumnPipingClassDetails < ActiveRecord::Migration
  def up
     change_column :piping_class_details, :piping_class_id, :integer
     change_column :piping_class_details, :piping_component_id, :integer
     change_column :piping_class_details, :section_no, :integer
     change_column :piping_class_details, :valve_id, :integer
  end

  def down
  end
end




