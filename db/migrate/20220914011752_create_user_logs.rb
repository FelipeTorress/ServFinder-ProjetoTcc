class CreateUserLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :user_logs do |t|
      t.string :action
      t.datetime :date_of_occurrence
      t.string :user_of_action
      t.string :info
    end
  end
end
