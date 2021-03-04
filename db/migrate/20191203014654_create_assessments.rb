class CreateAssessments < ActiveRecord::Migration[5.1]
  def change
    create_table :assessments do |t|
      t.string :name
      t.integer :criteria_id
      t.integer :rang

      t.timestamps
    end
  end
end
