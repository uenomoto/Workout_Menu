class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id, null: false
      t.integer :followed_id, null: false
      t.timestamps
      
      
      # 多くのデータを格納するテーブルや
      # 値がそれぞれ異なるようなカラムの中
      # 検索がよく行われるカラムなどに対して使うと効果的
      t.index [:follower_id, :followed_id], unique: true
    end
  end
end
