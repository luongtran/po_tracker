class AddSignToSignature < ActiveRecord::Migration
  def change
    add_column :signatures, :sign, :text
  end
end
