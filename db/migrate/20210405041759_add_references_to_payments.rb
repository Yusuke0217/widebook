class AddReferencesToPayments < ActiveRecord::Migration[6.0]
  def change
    add_reference :payments, :owner, foreign_key: true
  end
end
