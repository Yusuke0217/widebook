# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'

1.times do |n|
  menu_types = %W(料理 ドリンク )

  menu_types.each do |t|
    MenuType.create(name: t)
  end
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

  eat = Purpose.create(id: 1, name: "店内飲食", image: open("./db/fixtures/gurume.jpeg"))
  takeout = Purpose.create(id: 2, name: "テイクアウト", image: open("./db/fixtures/takeout.jpeg"))
  deliver = Purpose.create(id: 3, name: "デリバリー・宅配", image: open("./db/fixtures/deliver.jpeg"))
  # solo = Purpose.create(id: 4, name: "お一人様", image: open("./db/fixtures/solo.jpeg"))
  # date = Purpose.create(id: 5, name: "デート", image: open("./db/fixtures/date.jpeg"))
  # other = Purpose.create(name: "その他")
  # some = Purpose.create(name: "")

  gurume_data.each.with_index(1) { |a, n|
     Category.create(id: n, name: a, image: open("./db/fixtures/category/gurume/#{n}.jpeg"))
  }

end

