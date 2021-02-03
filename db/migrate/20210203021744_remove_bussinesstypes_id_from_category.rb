class RemoveBussinesstypesIdFromCategory < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :categories, :purposes
    remove_index :categories, :bussiness_type_id
    remove_column :categories, :bussiness_type_id, :bigint
  end
end
