class Location < ApplicationRecord
  validates :latitude, :longitude, presence: true

  has_many :sound_treks
  has_many :playlists, through: :sound_treks
  has_many :trekkers, through: :playlists, source: :creator
end
