class SoundTrek < ApplicationRecord
  validates :location_id, presence: true
# before_save :playlist_id

  belongs_to :playlist
  belongs_to :location
end
