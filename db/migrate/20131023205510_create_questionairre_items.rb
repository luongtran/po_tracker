class CreateQuestionairreItems < ActiveRecord::Migration
  def change
    create_table :questionairre_items do |t|
      t.integer :order
      t.string :question
      t.string :type

      t.timestamps
    end
  end
end
