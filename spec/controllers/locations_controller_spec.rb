require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  # Need to delete or rewrite these tests because we don't use a new action, we directly post to create action
  # let (:location) {Location.new(latitude: 41.881832, longitude:-87.623177)}

  # describe "GET #create" do
  #   it "responds with status code 200" do
  #     get :create
  #     expect(response).to have_http_status 200
  #   end

  #   it "assigns a new location to @location" do
  #     get :create
  #     expect(assigns(:location)).to be_a_new Location
  #   end
  # end

end
