class CreateImpressions < ActiveRecord::Migration[6.1]
  def change
    create_table :impressions do |t|
      t.integer :user_id, null: false
      t.text :text,       null: false
      t.timestamps
    end
  end
end
