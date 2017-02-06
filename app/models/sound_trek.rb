class SoundTrek < ApplicationRecord
  validates :location_id, :title, presence: true
  belongs_to :trekker, class_name: "User"
  belongs_to :location, dependent: :destroy
  has_many :ratings

  def aggregate_rating
    sample_size = self.ratings.length
    if sample_size > 0
      self.ratings.collect{|x| x.stars}.reduce(:+).to_f / sample_size
    else
      0
    end
  end
end
