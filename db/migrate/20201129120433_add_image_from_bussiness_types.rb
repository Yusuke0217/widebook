class AddImageFromBussinessTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :bussiness_types, :image, :string
  end
end
