class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.integer :user_id
      t.integer :user_selected_id
      t.string :title
      t.text :description
      t.datetime :limit_date
      t.decimal :value
      t.timestamps
    end
    add_index :services, :user_id
    add_index :services, :title
    add_index :services, :user_selected_id
  end
end
