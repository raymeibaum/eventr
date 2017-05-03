class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :content
      t.string :photo_url
      t.string :venue_name
      t.string :venue_address
      t.string :venue_city
      t.string :venue_state
      t.string :venue_zip
      t.string :latitude
      t.string :longitude
      t.string :date
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
