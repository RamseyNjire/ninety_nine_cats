class AddUserAgentDetailsToSession < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :operation_system, :string
    add_column :sessions, :browser, :string
    add_column :sessions, :browser_version, :string
  end
end
