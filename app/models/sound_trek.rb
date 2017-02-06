class SoundTrek < ApplicationRecord
  validates :location_id, :title, presence: true
  belongs_to :trekker, class_name: "User"
  belongs_to :location
end
