class CreateShopPurposes < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_purposes do |t|
      t.references :purpose, index: true, foreign_key: true
      t.references :shop, index: true, foreign_key: true

      t.timestamps
    end
  end
end
