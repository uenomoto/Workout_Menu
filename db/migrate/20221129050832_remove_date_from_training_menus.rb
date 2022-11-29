class RemoveDateFromTrainingMenus < ActiveRecord::Migration[6.1]
  def change
    remove_column :training_menus, :Date, :date
  end
end
