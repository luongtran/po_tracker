class PcdIndexes < ActiveRecord::Migration
  def up
  	add_index "piping_class_details", ["valve_id"]
  	add_index "piping_class_details", ["piping_class_id"]
  end

  def down
    remove_index "piping_class_details", ["valve_id"]
    remove_index "piping_class_details", ["piping_class_id"]
  end
end
