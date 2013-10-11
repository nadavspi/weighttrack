class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.decimal :value, precision: 5, scale: 2
      t.integer :user_id
      t.date :date

      t.timestamps
    end
    add_index :weights, [:user_id, :date]
  end
end
