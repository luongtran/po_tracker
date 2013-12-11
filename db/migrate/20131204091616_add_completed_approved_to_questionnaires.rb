class AddCompletedApprovedToQuestionnaires < ActiveRecord::Migration
  def change
    add_column :questionnaires, :completed_date, :datetime
  end
end
