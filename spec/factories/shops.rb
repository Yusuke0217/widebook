FactoryBot.define do
  factory :shop do
    name { "MyString" }
    address { "MyString" }
    phone_number { 1 }
    image { "MyString" }
    content { "MyText" }
    user { nil }
  end
end
