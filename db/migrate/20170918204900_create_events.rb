class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.timestamp :started_at
      t.timestamp :ended_at
      t.timestamps
    end
  end
end
