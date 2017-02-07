class RemoveRadiusColumnFromSoundTreks < ActiveRecord::Migration[5.0]
  def change
    remove_column :sound_treks, :radius
  end
end
