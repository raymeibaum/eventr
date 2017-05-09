class CreateEventUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :event_users do |t|
      t.integer :user_id
      t.integer :event_id
      t.boolean :is_favorite?

      t.timestamps
    end
  end
end
