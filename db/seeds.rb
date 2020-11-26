# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'

1.times do |n|
  # area = %W(和歌山エリア 白浜エリア 高野山エリア 那智勝浦エリア 串本エリア)
  area = %W(和歌山エリア)
  
  area.each do |a|
    Area.create(id: 1, name: a)
    # Area.create(name: a)
  end
end

1.times do |n|
  gurume_data = %W[イタリアン フレンチ 中華 和食 焼肉 カフェ ラーメン お寿司 ステーキ スイーツ バイキング 鍋 カレー とんかつ うどん お好み焼き ハンバーガー 居酒屋 パン コーヒー ご当地グルメ ]
  hotel_data = %W[シティホテル ラグジュアリー ログハウス 旅館 ゲストハウス]
  shop_data = %W[アパレル お土産 コンビニ スーパー お酒 雑貨 ショッピングモール 花 本 百貨店 薬局 ]
  tour_data = %W[美術館 文化遺産 自然 お寺・神社 夜景 心霊スポット ]
  event_data = %W[お祭り 〇〇体験 季節のイベント ]

  Category.create!(
      id: "1",
      name: "インスタ映え",
  )
  
  Category.create!(
      id: "99",
      name: "その他",
  )

  gurume_data.each.with_index(2) { |a, n|
   Category.create(id: n, name: a)
  }

  hotel_data.each.with_index(30) { |a, n|
   Category.create(id: n, name: a)
  }
  
  shop_data.each.with_index(40) { |a, n|
   Category.create(id: n, name: a)
  }

  tour_data.each.with_index(60) { |a, n|
   Category.create(id: n, name: a)
  }
 
  event_data.each.with_index(70) { |a, n|
   Category.create(id: n, name: a)
  }

end

50.times do |n|
  name = Faker::Games::Pokemon.name
  # phone_number = Faker::Number.leading_zero_number(digits: 10)
  phone_number = "12345678910"
  address = Faker::JapaneseMedia::Naruto.village
  content = Faker::Games::StreetFighter.move
  Shop.create!(
    user_id: 1,
    # area_id: 1,
    name: name,
    phone_number: phone_number,
    address: address,
    content: content,
  )
end

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
