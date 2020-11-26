class RemoveColumnResidenceIdToShops < ActiveRecord::Migration[6.0]
  def change
    remove_column :shops, :residence_id, :bigint
  end
end
