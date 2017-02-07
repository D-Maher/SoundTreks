class AddLatitudeColumnToSoundTreks < ActiveRecord::Migration[5.0]
  def change
    add_column :sound_treks, :latitude, :float
  end
end
