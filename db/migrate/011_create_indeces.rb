class CreateIndeces < ActiveRecord::Migration
  def self.up
    #Using ThinkingSphinx now.
    #[Company, Employee, Order, Unit, Vendor].each {
    #    |m| m.rebuild_index
    #}
  end

  def self.down
  end
end
