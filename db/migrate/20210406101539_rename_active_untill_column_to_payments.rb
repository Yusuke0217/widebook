class RenameActiveUntillColumnToPayments < ActiveRecord::Migration[6.0]
  def change
    rename_column :payments, :active_untill, :active_until
  end
end
