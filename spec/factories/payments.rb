FactoryBot.define do
  factory :payment do
    stripe_plan_id { "MyString" }
    stripe_customer_id { "MyString" }
    active_untill { "2021-04-02 00:00:20" }
    stripe_subscription_id { "MyString" }
  end
end
