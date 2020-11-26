class DropTableToResidences < ActiveRecord::Migration[6.0]
  def change
    drop_table :residences
  end
end
