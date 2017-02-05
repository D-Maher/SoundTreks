class PlaylistsController < ApplicationController

  def create
  end

  def show
    p "I GOT TO THE SHOW PAGE!"
    RSpotify.authenticate(ENV['spotify_id'], ENV['spotify_secret'])
    user = User.find_by(:id => session[:user_id])
    spotify_user = RSpotify::User.find(user.spotify_id)
    # spotify_user.playlists.each { |x| p x.name }
    # base_url = "https://embed.spotify.com/?theme=white&uri=spotify:trackset:My Playlist:"
    playlist = RSpotify::Playlist.find(user.spotify_id, '2y0EFH0qtraCl8fbfhI5IJ')
    base_url = "https://embed.spotify.com/?uri=spotify:user:#{user.spotify_id}:playlist:#{playlist.id}"
    # playlist.tracks.each do |track|
    #   base_url += track.id
    #   p base_url
    # end
    respond_to do |format|
      format.json { render layout: false, json: {:base_url => base_url }}
    end
  end



  private

  def get_playlists(user_id)

  end
end

"https://embed.spotify.com/?ur=spotify:user: :playlist:"

