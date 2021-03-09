class AddImageToOwners < ActiveRecord::Migration[6.0]
  def change
    add_column :owners, :image, :string
  end
end
