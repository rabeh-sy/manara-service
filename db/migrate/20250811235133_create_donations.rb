class CreateDonations < ActiveRecord::Migration[8.0]
  def change
    create_table :donations do |t|
      t.references :mosque, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :target_amount
      t.integer :current_amount
      t.integer :status
      t.boolean :is_verified

      t.timestamps
    end
  end
end
