class Location < ApplicationRecord
  validates :latitude, :longitude, presence: true
  validates :latitude, :longitude, numericality: true

  has_one :sound_trek

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
end
