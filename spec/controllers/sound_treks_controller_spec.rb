require 'rails_helper'

RSpec.describe SoundTreksController, type: :controller do
  let (:user) {User.create!(provider: "Spotify", uid: "somestring", nick_name: "Ashley")}

  let (:location) {Location.create!(latitude: 41.881832, longitude:-87.623177)}

  let (:soundtrek) {SoundTrek.create!(description: "This is a SoundTrek", trekker_id: user.id, title: "A New SoundTrek", location_id: location.id, playlist: "fasdfsadff")}

  describe "GET #edit" do
    it "responds with status code 200" do
      get :edit, params: { id: soundtrek.id, location_id: soundtrek.location_id}
      expect(response).to have_http_status 200
    end
  end

   describe "GET #show" do
    it "responds with status code 200" do
      get :show, params: { id: soundtrek.id }
      expect(response).to have_http_status 200
    end
  end

end
