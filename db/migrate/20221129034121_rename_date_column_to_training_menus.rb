class RenameDateColumnToTrainingMenus < ActiveRecord::Migration[6.1]
  
  def change
    rename_column :training_menus, :date, :day
  end
end
