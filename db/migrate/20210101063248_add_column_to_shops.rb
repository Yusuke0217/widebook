class AddColumnToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :holidays, :string
    add_column :shops, :budget, :string
    add_column :shops, :b_hours, :string
  end
end
