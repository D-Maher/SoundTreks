require 'rails_helper'

RSpec.describe SoundTreksController, type: :controller do
  let (:soundtrek) {Soundtrek.create!(description: "This is a SoundTrek", title: "A New SoundTrek", location_id: 7, playlist_id: 2)}

  describe "GET #edit" do
    it "responds with status code 200" do
      get :edit, params: { id: soundtrek.id }
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
