class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.timestamps
    end

    create_table :presence do |t|
      t.references :student, foreign_key: true, null: false
      t.references :activity, foreign_key: true, null: false
      t.boolean :present, default: false, null: false
    end
  end
end
