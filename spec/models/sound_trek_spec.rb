require "rails_helper"

# describe SoundTrek do
#   let (:location) {Location.new(latitude: 41.881832, longitude:-87.623177)}

#   it "has a latitude" do
#     expect(location.latitude).to eq 41.881832
#   end

#   it "has a longitude" do
#     expect(location.longitude).to eq -87.623177
#   end

#   it "will raise validation errors without latitude and longitude" do
#     expect{Location.create!}.to raise_error(ActiveRecord::RecordInvalid)
#   end

#   it "will raise an error if latitude and longitude are not floats" do
#     expect{Location.create!(latitude: "cat", longitude: "dog")}.to raise_error(ActiveRecord::RecordInvalid)
#   end
# end
