class RemoveColumnsFromShops < ActiveRecord::Migration[6.0]
  def change
    remove_column :shops, :address_street, :string
    remove_column :shops, :image, :string
  end
end
