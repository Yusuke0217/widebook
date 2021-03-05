class AddOwnerInfoToShops < ActiveRecord::Migration[6.0]
  def change
    add_reference :shops, :owner, foreign_key: true
  end
end
