class AddAceptCookies < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :accepted_cookies, :boolean, default: false
  end
  add_index :services, :user_selected_id
end
