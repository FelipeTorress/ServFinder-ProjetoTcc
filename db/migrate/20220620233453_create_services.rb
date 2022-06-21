class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.integer :user_creator_id
      t.integer :user_selected_id
      t.string :title
      t.text :description
      t.datetime :encerramento_anuncio
      t.decimal :preco
      t.timestamps
    end
  end
end
