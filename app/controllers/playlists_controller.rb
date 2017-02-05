class PlaylistsController < ApplicationController

  def create
  end

  def show
    RSpotify.authenticate(ENV['spotify_id'], ENV['spotify_secret'])
    user = User.find_by(:id => session[:user_id])
    spotify_user = RSpotify::User.find(user.spotify_id)
    playlist = RSpotify::Playlist.find(user.spotify_id, '2y0EFH0qtraCl8fbfhI5IJ')
    base_url = "https://embed.spotify.com/?uri=spotify:user:#{user.spotify_id}:playlist:#{playlist.id}"
    respond_to do |format|
      format.json { render layout: false, json: {:base_url => base_url }}
    end
  end



  private

  def get_playlists(user_id)

  end
end

