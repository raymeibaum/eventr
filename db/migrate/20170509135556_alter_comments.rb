class AlterComments < ActiveRecord::Migration[5.0]
  def change
		add_column :comments, :eventUser_id, :integer
		remove_column :comments, :event_id
		remove_column :comments, :user_id
  end
end
