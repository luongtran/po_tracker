class FixJoinTables < ActiveRecord::Migration
  def up
    change_column :piping_notes_piping_class_details, :piping_note_id, :integer
    change_column :piping_notes_piping_class_details, :piping_class_detail_id, :integer
    change_column :valves_valve_components, :valve_id, :integer
    change_column :valves_valve_components, :valve_component_id, :integer
  end

  def down
  end
end
