require 'rails_helper'

RSpec.describe SoundTreksController, type: :controller do

  describe "GET #edit" do
    it "responds with status code 200" do
      get :edit
      expect(response).to have_http_status 200
    end

    it "assigns a new location to @location" do
      get :create
      expect(assigns(:location)).to be_a_new Location
    end
  end

end
