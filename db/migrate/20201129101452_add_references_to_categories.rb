class AddReferencesToCategories < ActiveRecord::Migration[6.0]
  def change
    add_reference :categories, :bussiness_type, null: false, foreign_key: true
  end
end
