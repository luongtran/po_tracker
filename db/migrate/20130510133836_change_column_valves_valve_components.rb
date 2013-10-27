class ChangeColumnValvesValveComponents < ActiveRecord::Migration
  def up
    change_column :valves_valve_components, :valve_component_id, :integer
    change_column :valves_valve_components, :valve_id, :integer
  end

  def down
  end
end

