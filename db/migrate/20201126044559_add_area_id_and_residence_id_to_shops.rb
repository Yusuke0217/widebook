class AddAreaIdAndResidenceIdToShops < ActiveRecord::Migration[6.0]
  def change
    add_reference :shops, :area, foreign_key: true
  end
end
