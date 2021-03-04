class CreateTwoCriteria < ActiveRecord::Migration[5.1]
  def change
    create_table :two_criteria do |t|
      t.integer :criteria1_id
      t.integer :criteria2_id
      t.boolean :uses

      t.timestamps
    end
  end
end
