# require 'omniauth'
# require 'omniauth-spotify'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, '3cea8c83afda4f36b9620dd9591632b1', 'b87a70cbbd5744a286af6c8b36fc733c'
end
