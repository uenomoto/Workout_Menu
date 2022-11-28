class RemoveWeightFromTrainingMenu < ActiveRecord::Migration[6.1]
  def change
    remove_column :training_menus, :weight, :integer
  end
end
