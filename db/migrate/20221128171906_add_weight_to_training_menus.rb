class AddWeightToTrainingMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :training_menus, :weight, :integer
  end
end
