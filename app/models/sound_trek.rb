class SoundTrek < ApplicationRecord
  validates :playlist_id, :location_id, presence: true

  belongs_to :playlist
  belongs_to :location
end
