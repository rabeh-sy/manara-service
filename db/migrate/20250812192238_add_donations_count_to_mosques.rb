class AddDonationsCountToMosques < ActiveRecord::Migration[8.0]
  def change
    add_column :mosques, :donations_count, :integer, default: 0, null: false
  end
end
