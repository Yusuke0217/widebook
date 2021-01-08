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
  gurume_data = %W[イタリアン 中華 焼肉 カフェ 焼き鳥 ラーメン お寿司 ステーキ ご当地グルメ スイーツ 和食 鍋 カレー とんかつ うどん お好み焼き ハンバーガー 居酒屋 パン  そば 洋食レストラン ちゃんぽん ハンバーグ ピザ フレンチ バイキング   ]
  hotel_data = %W[シティホテル ビジネス ラグジュアリー 旅館 ゲストハウス ]
  shop_data = %W[アパレル お土産 雑貨 ショッピングモール 百貨店 お酒  ]
  tour_data = %W[美術館 文化遺産 自然 お寺・神社 夜景 温泉 アウトドア   ]
  event_data = %W[お祭り 体験 季節のイベント ]

  eat = BussinessType.create(id: 1, name: "グルメ", image: open("./db/fixtures/gurume.jpeg"))
  shop = BussinessType.create(id: 2, name: "ショッピング", image: open("./db/fixtures/shop.jpeg"))
  hotel = BussinessType.create(id: 3, name: "ホテル・宿泊", image: open("./db/fixtures/hotel.jpeg"))
  tour = BussinessType.create(id: 4, name: "観光・インスタ映え", image: open("./db/fixtures/tour.jpeg"))
  event = BussinessType.create(id: 5, name: "イベント", image: open("./db/fixtures/event.jpeg"))
  # other = BussinessType.create(name: "その他")
  # some = BussinessType.create(name: "")

  gurume_data.each.with_index(3) { |a, n|
     Category.create(id: n, name: a, bussiness_type_id: eat.id, image: open("./db/fixtures/category/gurume/#{n}.jpeg"))
  }

  shop_data.each.with_index(35) { |a, n|
    Category.create(id: n, name: a, bussiness_type_id: shop.id, image: open("./db/fixtures/category/shop/shop_#{n}.jpeg"))
  }

  hotel_data.each.with_index(50) { |a, n|
     Category.create(id: n, name: a, bussiness_type_id: hotel.id, image: open("./db/fixtures/category/hotel/hotel_#{n}.jpeg"))
  }

  tour_data.each.with_index(65) { |a, n|
    Category.create(id: n, name: a, bussiness_type_id: tour.id, image: open("./db/fixtures/category/tour/tour_#{n}.jpeg"))
  }
 
  event_data.each.with_index(80) { |a, n|
    Category.create(id: n, name: a, bussiness_type_id: event.id, image: open("./db/fixtures/category/event/event_#{n}.jpeg"))
  }

  # Category.create(id: 1, name: "インスタ映え")
  # Category.create(id: 99, name: "その他")

end

