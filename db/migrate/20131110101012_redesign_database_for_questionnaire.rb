class RedesignDatabaseForQuestionnaire < ActiveRecord::Migration
  def change
    drop_table :questionairre_items
    drop_table :vendor_answers
    drop_table :vendor_questionairres
    drop_table :vendor_questionairre_approvals
    drop_table :questionairre_answers
  end
end
