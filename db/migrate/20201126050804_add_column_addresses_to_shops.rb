class AddColumnAddressesToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :address_street, :string
    add_column :shops, :address_building, :string
  end
end
