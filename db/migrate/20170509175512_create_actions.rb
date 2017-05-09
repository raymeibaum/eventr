class CreateActions < ActiveRecord::Migration[5.0]
  def change
    create_table :actions do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :activity_id
      t.string :activity_type

      t.timestamps
    end
  end
end
