class CreateUserServices < ActiveRecord::Migration[5.2]
  def change
    create_table :user_services do |t|
      t.references :user, foreign_key: true
      t.references :service, foreign_key: true
      t.string :comment
      t.timestamps
    end
  end
end
