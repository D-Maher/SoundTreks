require 'rails_helper'

RSpec.describe LocationsController, type: :controller do

  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "assigns a new location to @location" do
      get :new
      expect(assigns(:location)).to be_a_new Location
    end
  end

end
