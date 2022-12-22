# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(
  password: 'admintest',
  email: 'admin@admin.com',
  nickname: 'アドミン'
  )

User.create!(
  nickname: 'トレーニー1',
  email: 'test@hoge.com',
  introduction: 'テストレーニング！！腕専門員',
  prefecture: 30,
  password: 'aaaaaaa'
  )

Genre.create!(
  name: '二頭筋',
  user_id: 1
  )

Genre.create!(
  name: '三頭筋',
  user_id: 1
  )

TrainingName.create!(
  genre_id: 1,
  user_id: 1,
  name: 'ダンベルカール',
  introduction: '反動をつけずにゆっくりを意識する'
  )

TrainingName.create!(
  genre_id: 1,
  user_id: 1,
  name: 'インクラインダンベルカール',
  introduction: 'ベンチを斜め４５度ぐらいにし座りながらトレーニング！'
  )

TrainingName.create!(
  genre_id: 2,
  user_id: 1,
  name: 'フレンチプレス',
  introduction: '絶対に無理のない重さで。'
  )

TrainingName.create!(
  genre_id: 2,
  user_id: 1,
  name: 'ケーブルプレスダウン',
  introduction: '肩とひじを固定して前腕だけを動かすことを意識'
  )

User.create!(
  nickname: 'トレーニー2',
  email: 'test2@hoge.com',
  introduction: '筋肉を喜ばせるぞ！！肩まわり専門員',
  prefecture: 22,
  password: 'aaaaaaa'
  )

Genre.create!(
  name: '肩',
  user_id: 2
  )
Genre.create!(
  name: '背中',
  user_id: 2
  )

TrainingName.create!(
  genre_id: 3,
  user_id: 2,
  name: 'ダンベルショルダープレス',
  introduction: '背筋を伸ばして胸を張る'
  )

TrainingName.create!(
  genre_id: 3,
  user_id: 2,
  name: 'サイドレイズ',
  introduction: '肘を伸ばしたままダンベルを真横に上げ肩の高さまであげる'
  )

TrainingName.create!(
  genre_id: 4,
  user_id: 2,
  name: 'チンニング',
  introduction: '腕ではなく背中を意識する'
  )

TrainingName.create!(
  genre_id: 4,
  user_id: 2,
  name: 'シーデットロウ',
  introduction: '背中を真っ直ぐにする'
  )


User.create!(
  nickname: 'トレーニー3',
  email: 'test3@hoge.com',
  introduction: '筋肉痛が起きて嬉しい＾＾胸トレ専門員',
  prefecture: 20,
  password: 'aaaaaaa'
  )

Genre.create!(
  name: '胸',
  user_id: 3
  )

TrainingName.create!(
  genre_id: 5,
  user_id: 3,
  name: 'ダンベルフライ',
  introduction: 'しっかりと開く'
  )

TrainingName.create!(
  genre_id: 5,
  user_id: 3,
  name: 'ベンチプレス',
  introduction: '補助がいないときは無理しないように！'
  )

TrainingName.create!(
  genre_id: 5,
  user_id: 3,
  name: 'ディップス',
  introduction: '胸だけでなくいろんな所を鍛えれる万能自重トレ'
  )
