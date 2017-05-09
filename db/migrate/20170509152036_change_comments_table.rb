class ChangeCommentsTable < ActiveRecord::Migration[5.0]
  def change
		rename_column :comments, :eventUser_id, :event_user_id
  end
end
