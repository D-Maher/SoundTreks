class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  has_many :playlists, foreign_key: :creator_id
  has_many :sound_treks, through: :playlists
end
