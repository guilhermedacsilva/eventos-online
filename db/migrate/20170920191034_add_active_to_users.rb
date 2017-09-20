class AddActiveToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :enabled, :boolean, default: false, null: false
  end
end
