class DropFavoritesTable < ActiveRecord::Migration[5.0]
  def change
		drop_table :favorites
  end
end
