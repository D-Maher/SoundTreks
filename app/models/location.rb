class Location < ApplicationRecord
  validates :latitude, :longitude, presence: true
  validates :latitude, :longitude, numericality: true

  has_one :sound_trek
end
