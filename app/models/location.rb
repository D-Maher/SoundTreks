class Location < ApplicationRecord
  validates :latitude, :longitude, presence: true
  validates :latitude, :longitude, numericality: true

  has_many :sound_treks
end
