class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name, null: false
      t.integer :workload
      t.integer :people_limit
      t.references :event, foreign_key: true
      t.timestamps
    end
  end
end
