# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"
CSV.foreach('db/city.csv', headers: true) do |row|
  City.create(id: row['id'],
              name: row['name'])
end

tags = Tag.create([{name: "40kg以上のダンベルが置いてある"},
                  {name: "DLプラットフォームがある"},
                  {name: "靴の貸出がある"},
                  {name: "ウェアの貸出がある"},
                  {name: "日焼けマシーンがある"}
                  ])

equiments = Equipment.create([{name: "ベンチプレス台"},
                              {name: "パワーラック"},
                              {name: "スミスマシン"},
                              {name: "アジャスタブルベンチ"},
                              {name: "フラットベンチ"},
                              {name: "ケーブルプーリー"}

  ])
