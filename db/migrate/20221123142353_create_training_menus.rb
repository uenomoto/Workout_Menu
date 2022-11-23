class CreateTrainingMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :training_menus do |t|
      t.integer :user_id,           null: false
      t.integer :training_name_id,  null: false
      t.date :date,                 null: false
      t.integer :count,             null: false
      t.integer :set,               null: false
      t.boolean :status,            null: false
      t.integer :weight,            null: false
      t.timestamps
    end
  end
end
