class CreateMosques < ActiveRecord::Migration[8.0]
  def change
    create_table :mosques do |t|
      t.integer :status
      t.string :name
      t.text :description
      t.string :longitude
      t.string :latitude
      t.text :location
      t.integer :capacity
      t.integer :size
      t.date :establish_year

      t.timestamps
    end
  end
end
