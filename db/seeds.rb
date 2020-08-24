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

Tag.create([{name: "40kg以上のダンベルが置いてある"},
            {name: "DLプラットフォームがある"},
            {name: "靴の貸出がある"},
            {name: "ウェアの貸出がある"},
            {name: "日焼けマシーンがある"}
            ])

10.times do |n|
  User.create!(
    name: "ユーザー#{n}",
    email: "example#{n}@example.com",
    password: "password"
  )
end

20.times do |n|
  Facility.create!(
    name: "#{('A'..'Z').to_a[n]}ジム",
    drop: rand(0..3),
    parking: rand(0..2),
    shower: rand(0..2),
    recordable: rand(0..2),
    visiter: rand(0..2),
    accessible_ten_min: rand(0..2),
    trainer: rand(0..2),
    open_all_time: rand(0..2),
    city_id: rand(1..5),
    poster_id: User.all.sample.id,
    monthly_fee: [5000, 7000, 10000, 12000].sample
  )
end
20.times do |n|
  Facility.create!(
    name: "Test Fitness #{n}号店",
    drop: rand(0..3),
    parking: rand(0..2),
    shower: rand(0..2),
    recordable: rand(0..2),
    visiter: rand(0..2),
    accessible_ten_min: rand(0..2),
    trainer: rand(0..2),
    open_all_time: rand(0..2),
    city_id: rand(1..5),
    poster_id: User.all.sample.id,
    monthly_fee: [5000, 7000, 10000, 12000].sample
  )
end

Facility.all.ids.sort.each do |f_id|
  (0..5).each do |equipment_name|
    Equipment.create!(
      name: equipment_name,
      amount: ([""]+ (0..5).to_a).sample,
      facility_id: f_id
    )
  end
  Tag.all.ids.sort.each do |t_id|
    if rand(3) == 0
      Tagging.create!(
        facility_id: f_id,
        tag_id: t_id
      )
    end
  end
  User.all.ids.sort.each do |u_id|
    if rand(3) == 0
      Review.create!(
        facility_id: f_id,
        user_id: u_id,
        machine: rand(1..5),
        free_weight: rand(1..5),
        caedio: rand(1..5)
      )
    end
  end
end
