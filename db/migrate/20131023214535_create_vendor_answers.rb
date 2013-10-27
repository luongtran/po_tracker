class CreateVendorAnswers < ActiveRecord::Migration
  def change
    create_table :vendor_answers do |t|
      t.integer :questionairre_item_id
      t.date :questionairre_date
      t.integer :vendor_id
      t.text :answer

      t.timestamps
    end
  end
end
