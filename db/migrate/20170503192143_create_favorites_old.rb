class CreateFavoritesOld < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.integer :event_id
      t.integer :user_id

      t.timestamps
    end
  end
end
