class AddAddressColumnToSoundTreks < ActiveRecord::Migration[5.0]
  def change
    add_column :sound_treks, :address, :string
  end
end
