class ChangeColumnAddLimit < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :name, :string, null: false
    change_column :users, :email, :string, null: false
    change_column :users, :email, :string, unique: true
    change_column :owners, :name, :string, null: false
    change_column :owners, :phone_number, :string, null: false
    change_column :owners, :email, :string, null: false
    change_column :shops, :name, :string, null: false
    change_column :shops, :address, :string, null: false
  end
end
