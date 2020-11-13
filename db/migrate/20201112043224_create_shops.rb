class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :image
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :shops, :name
    # add_index :area_id, :business_type_id, :category_id, tag_id
  end
end
