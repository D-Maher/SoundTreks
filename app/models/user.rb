class User < ApplicationRecord
  has_many :playlists, foreign_key: :creator_id
  has_many :sound_treks, through: :playlists

  def self.sign_in_from_omniauth(auth)
    # user_id = auth["extra"]["raw_info"]["id"]
    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
  end

  def self.create_user_from_omniauth(auth)
    create(
      provider: auth['provider'],
      uid: auth['uid'],
      name: auth['info']['name'],
      spotify_id: auth["extra"]["raw_info"]["id"]
      )
  end

end
