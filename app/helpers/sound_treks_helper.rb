module SoundTreksHelper
  def sound_trek_owner?(sound_trek)
    session[:user_id] == sound_trek.trekker_id
  end

  def rspotify_authenticate
    RSpotify.authenticate(ENV['spotify_id'], ENV['spotify_secret'])
  end

  def find_playlist(creator, playlist)
     playlist = RSpotify::Playlist.find(creator, playlist)
  end

  def find_spotify_user(spotify_id)
    RSpotify::User.find(spotify_id)
  end
end
