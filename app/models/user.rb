class User < ApplicationRecord
  has_many :sound_treks, foreign_key: "trekker_id"

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
