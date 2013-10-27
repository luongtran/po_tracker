class CreateVendorQuestionairre < ActiveRecord::Migration
  def change
    create_table(:vendor_questionairres, :id => false) do |t|
      t.references :vendor
      t.references :questionairre_items
    end
  end

end
