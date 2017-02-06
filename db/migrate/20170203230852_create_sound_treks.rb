class CreateSoundTreks < ActiveRecord::Migration[5.0]
  def change
    create_table :sound_treks do |t|
      t.text :description
      t.string :title, null: false
      t.integer :trekker_id, null: false
      t.integer :location_id, null: false
      t.integer :playlist_id, null: false
      t.float :radius, default: 5.0

      t.timestamps
    end
  end
end
