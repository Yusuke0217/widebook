class RemoveColumnThatIsAreaIdToShops < ActiveRecord::Migration[6.0]
  def change
    remove_column :shops, :area_id, :bigint
  end
end
