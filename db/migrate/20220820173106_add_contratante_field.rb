class AddContratanteField < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :isContratante, :boolean
    add_column :users, :address, :string
    add_column :users, :score, :integer
  end
end
