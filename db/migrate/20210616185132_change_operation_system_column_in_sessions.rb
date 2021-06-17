class ChangeOperationSystemColumnInSessions < ActiveRecord::Migration[5.2]
  def change
    remove_column :sessions, :operation_system

    add_column :sessions, :operating_system, :string
  end
end
