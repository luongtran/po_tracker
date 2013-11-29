class CreateSignatures < ActiveRecord::Migration
  def change
    create_table :signatures do |t|
      t.integer :employee_id
      t.string :text

      t.timestamps
    end
  end
end
