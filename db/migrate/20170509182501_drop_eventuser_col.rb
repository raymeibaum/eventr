class DropEventuserCol < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :event_user_id
  end
end
