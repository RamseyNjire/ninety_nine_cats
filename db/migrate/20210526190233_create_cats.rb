class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|

      t.date :birthdate, null: false
      t.string :color, null: false
      t.string :name, null: false
      t.string :sex, null: false, limit: 1
      t.text :description

      t.index :name, unique: true

      t.timestamps
    end
  end
end
