# require 'omniauth'
# require 'omniauth-spotify'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['spotify_id'], ENV['spotify_secret']
end
