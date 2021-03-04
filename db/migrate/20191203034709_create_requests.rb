class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :assessment11_id
      t.integer :assessment12_id
      t.integer :assessment21_id
      t.integer :assessment22_id
      t.string :ans

      t.timestamps
    end
  end
end
