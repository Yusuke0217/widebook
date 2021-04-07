class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :stripe_plan_id
      t.string :stripe_customer_id
      t.datetime :active_untill, null: false
      t.string :stripe_subscription_id

      t.timestamps
    end
  end
end
