class CreateTrainingNames < ActiveRecord::Migration[6.1]
  def change
    create_table :training_names do |t|
      t.integer :genre_id,  null: false
      t.integer :user_id,   null: false
      t.string :name,       null: false
      t.text :introduction, null: false
      t.timestamps
    end
  end
end
