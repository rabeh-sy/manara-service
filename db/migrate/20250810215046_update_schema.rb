class UpdateSchema < ActiveRecord::Migration[8.0]
  def change
    add_column :mosques, :city, :integer
    rename_column :mosques, :location, :address

    add_index :mosques, :city
  end
end
