class RenameTypeColumnInQuestionaires < ActiveRecord::Migration
  def up
    rename_column :questionairre_items, :type, :question_type
  end

  def down
  end
end
