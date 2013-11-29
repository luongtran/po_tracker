class RenameOrderColumnInQuestionAnswers < ActiveRecord::Migration
  def change
    rename_column :question_answers, :order, :position
  end
end
