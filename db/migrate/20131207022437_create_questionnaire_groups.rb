class CreateQuestionnaireGroups < ActiveRecord::Migration
  def up
    create_table :questionnaire_groups do |t|
      t.integer :questionnaire_id
      t.integer :approver_id
      
      t.timestamps
    end
  end
  def down
    
  end
end
