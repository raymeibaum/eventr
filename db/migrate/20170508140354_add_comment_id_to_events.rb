class AddCommentIdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :comment_id, :integer
  end
end
