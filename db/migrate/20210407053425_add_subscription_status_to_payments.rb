class AddSubscriptionStatusToPayments < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :stripe_subscription_status, :string, null: false
  end
end
