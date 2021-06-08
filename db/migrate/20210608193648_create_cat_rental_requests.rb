class CreateCatRentalRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :cat_rental_requests do |t|

      t.integer :cat_id, null: false, cat: :references
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :status, default: 'PENDING', null: false

      t.index :cat_id

      t.timestamps
    end
  end
end