class RandomImage < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_photo, :string
    add_column :services, :cover_photo, :string
  end
end
