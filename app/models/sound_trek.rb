class SoundTrek < ApplicationRecord
  validates :location_id, :title, :latitude, :longitude, presence: true
  validates :latitude, :longitude, numericality: true

  belongs_to :trekker, class_name: "User"
  has_many :ratings

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  def average_rating
    if num_of_ratings > 0
      self.ratings.collect{|rating| rating.stars}.reduce(:+).to_f / num_of_ratings
    else
      0
    end
  end

  def num_of_ratings
    self.ratings.length
  end

end

# class Location < ApplicationRecord
#   validates :latitude, :longitude, presence: true
#   validates :latitude, :longitude, numericality: true

#   has_one :sound_trek

#   reverse_geocoded_by :latitude, :longitude
#   after_validation :reverse_geocode
# end

