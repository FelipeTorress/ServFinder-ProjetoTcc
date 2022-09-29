class AddFinishedToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :finished, :boolean, default: false
    add_index :services, :finished
  end
end