class AddLongitudeColumnToSoundTreks < ActiveRecord::Migration[5.0]
  def change
    add_column :sound_treks, :longitude, :float
  end
end
