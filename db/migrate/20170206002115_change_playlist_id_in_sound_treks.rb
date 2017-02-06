class ChangePlaylistIdInSoundTreks < ActiveRecord::Migration[5.0]
  def change
    rename_column :sound_treks, :playlist_id, :playlist
    change_column :sound_treks, :playlist, :string
  end
end
