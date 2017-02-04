class PlaylistsController < ApplicationController

  def create
  end

  def show
    RSpotify.authenticate('3cea8c83afda4f36b9620dd9591632b1', 'b87a70cbbd5744a286af6c8b36fc733c')
    user = User.find_by(:id => session[:user_id])
    p "SESSION!!!"
    p session[:user_id]
    p "HERE IS OUR USER!"
    p user
    p "HERE ARE OUR PARAMS"
    p params
    spotify_user = RSpotify::User.find(user.spotify_id)
    p "THIS IS OUR SPOTIFY USER"
    p spotify_user
    p "MY PLAYLISTSSSSS"
    p spotify_user.playlists
    @playlist = RSpotify::Playlist.find(user.spotify_id, '2MpRgqhgKNaClm9fyHnNfS')
    p "EMINEM!!!!!!!!!!!!!!!!!!"
    render 'playlists/show'
  end



  private

  def get_playlists(user_id)

  end
end

