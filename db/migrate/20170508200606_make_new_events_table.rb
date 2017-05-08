class MakeNewEventsTable < ActiveRecord::Migration[5.0]
  def change
		create_table :events do |t|
      t.string :event_id

      t.timestamps
    end
  end
end
