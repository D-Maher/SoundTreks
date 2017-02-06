class Rating < ApplicationRecord
  belongs_to :sound_trek
  belongs_to :trekker, class_name: "User"

  validates :stars, presence: true, inclusion: {in: 0..5}
end
