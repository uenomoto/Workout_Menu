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
  [
    {nickname: 'トレーニー1',email: 'test@hoge.com',introduction: 'テストレーニング！！',prefecture: 30,password: 'aaaaaaa'},
    {nickname: 'トレーニー2',email: 'test2@hoge.com',introduction: '筋肉を喜ばせましょう',prefecture: 22,password: 'aaaaaaa'},
    {nickname: 'トレーニー3',email: 'test3@hoge.com',introduction: '筋肉痛が起きて嬉しい',prefecture: 20,password: 'aaaaaaa'},
    {nickname: '上野 元希',email: 'm.u@developer.com',introduction: 'トレも学習も継続は力なり！',prefecture: 22,password: 'moto0301',
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/hiyo.png"), filename:"hiyo.png")}
  ]
)

Genre.create!(
  [
    {name: '二頭筋',user_id: 1},
    {name: '三頭筋',user_id: 1},
    {name: '肩',    user_id: 2},
    {name: '背中',  user_id: 2},
    {name: '胸',    user_id: 3},
    {name: '二頭筋',user_id: 4},
    {name: '三頭筋',user_id: 4},
    {name: '肩',    user_id: 4},
    {name: '背中',  user_id: 4},
    {name: '胸',    user_id: 4},
    {name: '脚',    user_id: 4}
  ]
)

TrainingName.create!(
  [
    {genre_id: 1,user_id: 1,name: 'ダンベルカール',              introduction: '反動をつけずにゆっくりを意識する'},
    {genre_id: 1,user_id: 1,name: 'インクラインダンベルカール',  introduction: 'ベンチを斜め４５度ぐらいにし座りながらトレーニング！'},
    {genre_id: 2,user_id: 1,name: 'フレンチプレス',              introduction: '絶対に無理のない重さで。'},
    {genre_id: 2,user_id: 1,name: 'ケーブルプレスダウン',        introduction: '肩とひじを固定して前腕だけを動かすことを意識'},
    {genre_id: 3,user_id: 2,name: 'ダンベルショルダープレス',    introduction: '背筋を伸ばして胸を張る'},
    {genre_id: 3,user_id: 2,name: 'サイドレイズ',                introduction: '肘を伸ばしたままダンベルを真横に上げ肩の高さまであげる'},
    {genre_id: 4,user_id: 2,name: 'チンニング',                  introduction: '腕ではなく背中を意識する'},
    {genre_id: 4,user_id: 2,name: 'シーデットロウ',              introduction: '背中を真っ直ぐにする'},
    {genre_id: 5,user_id: 3,name: 'ダンベルフライ',              introduction: 'しっかりと開く'},
    {genre_id: 5,user_id: 3,name: 'ベンチプレス',                introduction: '補助がいないときは無理しないように！'},
    {genre_id: 5,user_id: 3,name: 'ディップス',                  introduction: '胸だけでなくいろんな所を鍛えれる万能自重トレ'},
    {genre_id: 6,user_id: 4,name: 'ダンベルカール',              introduction: ''},
    {genre_id: 6,user_id: 4,name: 'インクラインダンベルカール',  introduction: ''},
    {genre_id: 6,user_id: 4,name: 'プリチャーカール',            introduction: ''},
    {genre_id: 6,user_id: 4,name: 'ハンマーカール',              introduction: ''},
    {genre_id: 6,user_id: 4,name: 'バーベルカール',              introduction: ''},
    {genre_id: 7,user_id: 4,name: 'フレンチプレス',              introduction: ''},
    {genre_id: 7,user_id: 4,name: 'トライセプスキックバック',    introduction: ''},
    {genre_id: 7,user_id: 4,name: 'ナローベンチプレス',          introduction: ''},
    {genre_id: 7,user_id: 4,name: 'トライセップエクステンション',introduction: ''},
    {genre_id: 8,user_id: 4,name: 'ダンベルショルダープレス',    introduction: ''},
    {genre_id: 8,user_id: 4,name: 'サイドレイズ',                introduction: ''},
    {genre_id: 8,user_id: 4,name: 'リアレイズ',                  introduction: ''},
    {genre_id: 9,user_id: 4,name: 'チンニング',                  introduction: ''},
    {genre_id: 9,user_id: 4,name: 'シングルロウ',                introduction: ''},
    {genre_id: 9,user_id: 4,name: 'ラットプルダウン',            introduction: ''},
    {genre_id: 9,user_id: 4,name: 'シーデットロウ',              introduction: ''},
    {genre_id: 10,user_id: 4,name: 'ベンチプレス',               introduction: 'スミスマシン使用'},
    {genre_id: 10,user_id: 4,name: 'ダンベルフライ',             introduction: ''},
    {genre_id: 10,user_id: 4,name: 'ディップス',                 introduction: ''},
    {genre_id: 11,user_id: 4,name: 'スクワット',                 introduction: '自重で'},
    {genre_id: 11,user_id: 4,name: 'ブルガリアンスクワット',     introduction: '両手にダンベルを持つ'},
    {genre_id: 11,user_id: 4,name: 'レッグプレス',               introduction: ''}
  ]
)

TrainingMenu.create!(
  [
    {user_id: 4,genre_id: 6,training_name_id: 12,date: '2023-02-10',
    count: 10,set: 3,status: 1,weight: 12,distance: '',completion: false},
    {user_id: 4,genre_id: 6,training_name_id: 13,date: '2023-02-10',
    count: 10,set: 3,status: 1,weight: 10,distance: '',completion: false},
    {user_id: 4,genre_id: 6,training_name_id: 14,date: '2023-02-10',
    count: 10,set: 3,status: 1,weight: 15,distance: '',completion: false},
    {user_id: 4,genre_id: 6,training_name_id: 15,date: '2023-02-10',
    count: 10,set: 3,status: 1,weight: 10,distance: '',completion: false},
    {user_id: 4,genre_id: 6,training_name_id: 16,date: '2023-02-10',
    count: 10,set: 3,status: 1,weight: 20,distance: '',completion: false},
    {user_id: 4,genre_id: 7,training_name_id: 17,date: '2023-02-11',
    count: 10,set: 3,status: 1,weight: 15,distance: '',completion: false},
    {user_id: 4,genre_id: 7,training_name_id: 18,date: '2023-02-11',
    count: 10,set: 3,status: 1,weight: 7,distance: '',completion: false},
    {user_id: 4,genre_id: 7,training_name_id: 19,date: '2023-02-11',
    count: 10,set: 3,status: 1,weight: 20,distance: '',completion: false},
    {user_id: 4,genre_id: 7,training_name_id: 20,date: '2023-02-11',
    count: 10,set: 3,status: 1,weight: 20,distance: '',completion: false},
    {user_id: 4,genre_id: 8,training_name_id: 21,date: '2023-02-13',
    count: 10,set: 3,status: 1,weight: 12,distance: '',completion: false},
    {user_id: 4,genre_id: 8,training_name_id: 22,date: '2023-02-13',
    count: 10,set: 3,status: 1,weight: 7,distance: '',completion: false},
    {user_id: 4,genre_id: 8,training_name_id: 23,date: '2023-02-13',
    count: 10,set: 3,status: 1,weight: 5,distance: '',completion: false},
    {user_id: 4,genre_id: 9,training_name_id: 24,date: '2023-02-15',
    count: 10,set: 3,status: 0,weight: '',distance: '',completion: false},
    {user_id: 4,genre_id: 9,training_name_id: 25,date: '2023-02-15',
    count: 10,set: 3,status:1 ,weight: 15,distance: '',completion: false},
    {user_id: 4,genre_id: 9,training_name_id: 26,date: '2023-02-15',
    count: 10,set: 3,status: 1,weight: 25,distance: '',completion: false},
    {user_id: 4,genre_id: 9,training_name_id: 27,date: '2023-02-15',
    count: 10,set: 3,status: 1,weight: 25,distance: '',completion: false},
    {user_id: 4,genre_id: 10,training_name_id: 28,date: '2023-02-17',
    count: 10,set: 3,status: 1,weight: 40,distance: '',completion: false},
    {user_id: 4,genre_id: 10,training_name_id: 29,date: '2023-02-17',
    count: 10,set: 3,status: 1,weight: 20,distance: '',completion: false},
    {user_id: 4,genre_id: 10,training_name_id: 30,date: '2023-02-17',
    count: 10,set: 3,status: 0,weight: '',distance: '',completion: false},
    {user_id: 4,genre_id: 11,training_name_id: 31,date: '2023-02-19',
    count: 10,set: 3,status: 0,weight: '',distance: '',completion: false},
    {user_id: 4,genre_id: 11,training_name_id: 32,date: '2023-02-19',
    count: 10,set: 3,status: 1,weight: 10,distance: '',completion: false},
    {user_id: 4,genre_id: 11,training_name_id: 33,date: '2023-02-19',
    count: 10,set: 3,status: 1,weight: 50,distance: '',completion: false}
  ]
)


Tweet.create!(
  [
    {user_id: 4,text: "N+1問題をもっと理解したい"},
  ]
)

PostComment.create!(
  [
    {user_id: 1,tweet_id: 1,comment: 'レスポンスが遅くなっちゃうよね'},
    {user_id: 2,tweet_id: 1,comment: 'わかる〜'},
    {user_id: 3,tweet_id: 1,comment: 'うむ'},
    {user_id: 4,tweet_id: 1,comment: '自作自演です'}
  ]
)
