class AlterColumnTableFieldtype < ActiveRecord::Migration[5.0]
  def change
      change_table :comments do |t|
        t.change :event_id, :string
      end
  end
end
