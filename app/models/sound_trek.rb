class SoundTrek < ApplicationRecord
  validates :location_id, :title, presence: true

  belongs_to :location
end
