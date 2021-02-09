class AddColumnToMenusAvailability < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :availability, :boolean, default: false, null: false
  end
end
