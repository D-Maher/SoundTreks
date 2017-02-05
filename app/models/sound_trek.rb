class SoundTrek < ApplicationRecord
  validates :location_id, :title, presence: true
# before_save :playlist_id

  belongs_to :playlist
  belongs_to :location
end
