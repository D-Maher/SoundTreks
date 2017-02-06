class SoundTrek < ApplicationRecord
  validates :location_id, :title, presence: true
  belongs_to :trekker, class_name: "User"
  belongs_to :location, dependent: :destroy
  has_many :ratings

  def average_rating
    num_of_ratings = self.ratings.length
    if num_of_ratings > 0
      self.ratings.collect{|rating| rating.stars}.reduce(:+).to_f / num_of_ratings
    else
      0
    end
  end

end
