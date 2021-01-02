class CreateMedia < ActiveRecord::Migration[6.0]
  def change
    create_table :media do |t|
      t.references :shop, null: false, foreign_key: true
      t.string :home_page
      t.string :facebook
      t.string :twitter
      t.string :instagram

      t.timestamps
    end
  end
end
