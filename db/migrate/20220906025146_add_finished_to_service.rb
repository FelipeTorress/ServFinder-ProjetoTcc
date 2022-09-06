class AddFinishedToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :finished, :boolean, default: false
  end
  add_index :services, :user_selected_id
  add_index :services, :finished
end