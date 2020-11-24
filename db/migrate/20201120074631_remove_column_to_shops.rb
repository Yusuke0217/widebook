class RemoveColumnToShops < ActiveRecord::Migration[6.0]
  def change
    remove_column :shops, :category_id, :integer
  end
end
