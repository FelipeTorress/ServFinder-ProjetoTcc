class AddNewFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :permit_phone_number, :boolean, default: true
    add_column :users, :permit_email, :boolean, default: true
  end
end
