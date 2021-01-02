class RenameColumnToShops < ActiveRecord::Migration[6.0]
  def change
    rename_column :shops, :b_hours, :b_hours_first
    add_column :shops, :b_hours_last, :string
  end
end
