class RenameColumnToShopsAtAddressStreet < ActiveRecord::Migration[6.0]
  def change
    rename_column :shops, :address_street, :address
  end
end
