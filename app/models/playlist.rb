class Playlist < ApplicationRecord
  validates :title, :creator_id, presence: true

  belongs_to :creator, class_name: "User"
  has_many :sound_treks
end
