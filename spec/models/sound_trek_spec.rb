require "rails_helper"

RSpec.describe SoundTrek, type: :model do
  let(:sound_trek) { SoundTrek.new(description: "I love hiking and listening to this", title: "Hiking", trekker_id: 1, playlist: "skdhfls", latitude: 41.8762180, longitude: -87.6531470) }

  let(:user) { User.create!(provider: "spotify", uid: "ashleyyang", nick_name: "Ash", spotify_id: "skdhfls") }

  let(:saved_sound_trek) { SoundTrek.new(description: "I love biking and listening to this", title: "Biking", trekker_id: user.id, playlist: "skdhfls", latitude: 41.8762180, longitude: -87.6531470) }

  it 'has a description' do
    expect(sound_trek.description).to eq "I love hiking and listening to this"
  end

  it 'has a title' do
    expect(sound_trek.title).to eq "Hiking"
  end

  it 'has trekker id' do
    expect(sound_trek.trekker_id).to eq 1
  end

  it 'has a playlist' do
    expect(sound_trek.playlist).to eq "skdhfls"
  end

  it 'has latitude' do
    expect(sound_trek.latitude).to eq 41.8762180
  end

  it 'has longitude' do
    expect(sound_trek.longitude).to eq -87.6531470
  end

  describe "validations" do
    context "#reverse_geocode" do
      it "has an address after validation" do
        sound_trek.save
        expect(sound_trek.address).not_to be_nil
      end
    end
  end
end

