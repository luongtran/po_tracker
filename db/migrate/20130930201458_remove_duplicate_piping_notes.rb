class RemoveDuplicatePipingNotes < ActiveRecord::Migration
  def up
  	#This will create a table with all the distinct notes/details
  	execute "create table unique_piping_notes AS SELECT piping_note_id, piping_class_detail_id, COUNT(*) AS dupes FROM piping_notes_piping_class_details WHERE piping_note_id IS NOT NULL and piping_class_detail_id IS NOT NULL GROUP BY piping_note_id, piping_class_detail_id HAVING dupes = 1 ORDER BY dupes DESC;"
  	execute "RENAME TABLE piping_notes_piping_class_details TO old_piping_notes_piping_class_details"
	execute "RENAME TABLE unique_piping_notes TO piping_notes_piping_class_details"  	
	execute "create unique index pn_pcd_index on piping_notes_piping_class_details(piping_class_detail_id, piping_note_id);"
  end

  def down
  end
end
