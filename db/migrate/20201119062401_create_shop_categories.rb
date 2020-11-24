class CreateShopCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_categories do |t|
      t.references :shop, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
      t.index [:shop_id, :category_id], unique: true
    end
  end
end
