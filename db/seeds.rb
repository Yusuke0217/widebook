# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'

User.create!(
  id: 1,
  # id: ENV['ID'],
  name: 'Mihael',
  email: 'hogehoge@example.com',
  password: 'hogehoge',
  # email: ENV['EMAIL'],
  # password: ENV['PASSWORD'],
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)

1.times do |n|
  cards = %W(Visa JCB Master AMEX )

  cards.each do |c|
    PayCard.create(name: c)
  end
end

1.times do |n|
  # area = %W(和歌山エリア 白浜エリア 高野山エリア 那智勝浦エリア 串本エリア)
  area = %W(和歌山エリア)
  
  area.each do |a|
    Area.create(id: 1, name: a)
    # Area.create(name: a)
  end
end

1.times do |n|
  gurume_data = %W[イタリアン フレンチ 中華 和食 焼肉 カフェ ラーメン お寿司 ステーキ スイーツ バイキング 鍋 カレー とんかつ うどん お好み焼き ハンバーガー 居酒屋 パン ご当地グルメ ]
  hotel_data = %W[シティホテル ラグジュアリー ログハウス 旅館 ゲストハウス]
  shop_data = %W[アパレル お土産 お酒 雑貨 ショッピングモール 本 百貨店 ]
  tour_data = %W[美術館 文化遺産 自然 お寺・神社 夜景 ]
  event_data = %W[お祭り 〇〇体験 季節のイベント ]

  eat = BussinessType.create(id: 1, name: "グルメ", image: open("./db/fixtures/gurume.jpeg"))
  shop = BussinessType.create(id: 2, name: "ショッピング", image: open("./db/fixtures/shopping.jpeg"))
  hotel = BussinessType.create(id: 3, name: "ホテル・宿泊", image: open("./db/fixtures/stayhome.jpeg"))
  tour = BussinessType.create(id: 4, name: "観光・インスタ映え", image: open("./db/fixtures/ocean-view.jpeg"))
  event = BussinessType.create(id: 5, name: "イベント", image: open("./db/fixtures/event2.jpeg"))
  # other = BussinessType.create(name: "その他")
  # some = BussinessType.create(name: "")

  gurume_data.each.with_index(3) { |a, n|
     Category.create(id: n, name: a, bussiness_type_id: eat.id)
  }

  shop_data.each.with_index(45) { |a, n|
    Category.create(id: n, name: a, bussiness_type_id: shop.id)
  }

  hotel_data.each.with_index(30) { |a, n|
     Category.create(id: n, name: a, bussiness_type_id: hotel.id)
  }

  tour_data.each.with_index(65) { |a, n|
    Category.create(id: n, name: a, bussiness_type_id: tour.id)
  }
 
  event_data.each.with_index(80) { |a, n|
    Category.create(id: n, name: a, bussiness_type_id: event.id)
  }

  Category.create(id: 1, name: "インスタ映え")
  Category.create(id: 99, name: "その他")

end

50.times do |n|
  name = Faker::Games::Pokemon.name
  # phone_number = Faker::Number.leading_zero_number(digits: 10)
  phone_number = "12345678910"
  address = Faker::JapaneseMedia::Naruto.village
  content = Faker::Games::StreetFighter.move
  Shop.create!(
    user_id: 1,
    area_id: 1,
    name: name,
    phone_number: phone_number,
    holidays: "金曜日",
    budget: rand(1000..20000),
    b_hours_first: "9:00",
    b_hours_last: "22:30",
    booking: true,
    address: address,
    content: content,
    category_ids: rand(3..23),
  )
end


