class AddCompletionToTrainingMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :training_menus, :completion, :boolean, default: false
  end
end
