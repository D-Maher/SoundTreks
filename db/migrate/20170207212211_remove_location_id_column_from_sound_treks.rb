class RemoveLocationIdColumnFromSoundTreks < ActiveRecord::Migration[5.0]
  def change
    remove_column :sound_treks, :location_id
  end
end
