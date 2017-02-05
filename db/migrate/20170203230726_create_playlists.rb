class CreatePlaylists < ActiveRecord::Migration[5.0]
  def change
    create_table :playlists do |t|
      t.string :title, null: false
      t.integer :creator_id, null: false
      t.string :spotify_id

      t.timestamps
    end
  end
end
