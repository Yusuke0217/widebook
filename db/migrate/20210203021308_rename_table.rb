class RenameTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :bussiness_types, :purposes
  end
end
