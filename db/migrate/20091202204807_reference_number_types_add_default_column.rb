class ReferenceNumberTypesAddDefaultColumn < ActiveRecord::Migration
  def self.up
    #Lht follow pre-migration
    unless column_exists? :reference_number_types, :default
      remove_column :reference_number_types, :default
  		add_column :reference_number_types, :default, :boolean, :default => false
    end
  end

  def self.down
    remove_column :reference_number_types, :default
  end
end
