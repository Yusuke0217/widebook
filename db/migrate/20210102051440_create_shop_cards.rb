class CreateShopCards < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_cards do |t|
      t.references :shop, null: false, foreign_key: true
      t.references :pay_card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
