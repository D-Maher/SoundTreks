class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :sound_trek_id, null: false
      t.integer :trekker_id, null: false
      t.integer :stars, default: 0

      t.timestamps
    end
  end
end
