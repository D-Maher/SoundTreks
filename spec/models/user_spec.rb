require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { User.new(provider: "spotify", uid: "ashley", name: "Ash", spotify_id: "skdhfls") }

    it 'has a provider' do
    expect(user.provider).to eq "spotify"
    end

    it 'has a uid' do
    expect(user.uid).to eq "ashley"
    end

    it 'has name' do
    expect(user.name).to eq "Ash"
    end

    it 'has spotify_id' do
    expect(user.spotify_id).to eq "skdhfls"
    end
end
