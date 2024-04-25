# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




  Customer.create(
    last_name: "山田",
    first_name: "太郎",
    last_name_kana: 'ヤマダ',
    first_name_kana: "タロウ",
    postal_code: 1000000,
    address: "東京都新宿区ズンバタワー",
    telephone_number: 10000000000,
    email: "yamada@taro",
    encrypted_password: 'yamadataro',
    password_confirmation: 'yamadataro',
    is_active: true
  )


Admin.create!(
  email: 'admin@admin',
  password: 'testtest'
)

