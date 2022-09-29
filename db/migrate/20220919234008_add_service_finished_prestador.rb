class AddServiceFinishedPrestador < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :finished_prestador, :boolean, default: false
    add_index :services, :finished_prestador
  end
end
