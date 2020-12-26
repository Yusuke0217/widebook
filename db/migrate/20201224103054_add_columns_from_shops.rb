class AddColumnsFromShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :booking, :boolean, default: false, null: false
  end
end
