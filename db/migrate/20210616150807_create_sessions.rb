class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :session_token, null: false
      t.integer :user_id, null: false, user: :references

      t.index :user_id
      t.index :session_token, unique: true
    end
  end
end
