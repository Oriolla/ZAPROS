class CreateNirs < ActiveRecord::Migration[5.1]
  def change
    create_table :nirs do |t|
      t.string :name
      t.integer :university_id
      t.integer :assessment1_id
      t.integer :assessment2_id
      t.integer :assessment3_id
      t.float :v

      t.timestamps
    end
  end
end
