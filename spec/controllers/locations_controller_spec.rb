require 'rails_helper'

RSpec.describe LocationsController, type: :controller do

  describe "GET #create" do
    it "responds with status code 200" do
      get :create
      expect(response).to have_http_status 200
    end

    it "assigns a new location to @location" do
      get :create
      expect(assigns(:location)).to be_a_new Location
    end
  end

end
