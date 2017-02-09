require 'rails_helper'

RSpec.describe SoundTreksController, type: :controller do
  let (:user) {User.create!(provider: "Spotify", uid: "somestring", nick_name: "Ashley")}

  let (:soundtrek) {SoundTrek.create!(description: "This is a SoundTrek", trekker_id: user.id, title: "A New SoundTrek", latitude: 41.881832, longitude:-87.623177, playlist: "fasdfsadff")}

  # describe "GET #edit" do
  #   it "responds with status code 200" do
  #     get :edit, params: { id: soundtrek.id}
  #     expect(response).to have_http_status 200
  #   end
  # end

   describe "GET #show" do
    it "responds with status code 302 which redirects to home if user is not logged in" do
      get :show, params: { id: soundtrek.id }
      expect(response).to have_http_status 302
    end
  end

end
