class RemoveAncestryFromCategories < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :ancestry
  end
end
