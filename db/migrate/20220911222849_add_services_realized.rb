class AddServicesRealized < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :services_realized, :integer, default: 0
  end
end
