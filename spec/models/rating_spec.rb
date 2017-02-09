require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:rating) { Rating.new(sound_trek_id: 1, trekker_id: 1, stars: 5) }

  it 'has a sound_trek_id' do
    expect(rating.sound_trek_id).to eq 1
  end

  it 'has a trekker_id' do
    expect(rating.trekker_id).to eq 1
  end

  it 'has stars' do
    expect(rating.stars).to eq 5
  end
end
