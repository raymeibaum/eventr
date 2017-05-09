class DropEventUsers < ActiveRecord::Migration[5.0]
  def change
    drop_table :event_users
  end
end
