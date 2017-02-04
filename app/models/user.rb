class User < ApplicationRecord
  # validates :name, :email, presence: true
  # validates :email, uniqueness: true

  has_many :playlists, foreign_key: :creator_id
  has_many :sound_treks, through: :playlists

  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
  end

  def self.create_user_from_omniauth(auth)
    create(
      provider: auth['provider'],
      uid: auth['uid'],
      name: auth['info']['name']
      )
  end

end
