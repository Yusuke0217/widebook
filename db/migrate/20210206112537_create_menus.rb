class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.references :menu_type, foreign_key: true
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
