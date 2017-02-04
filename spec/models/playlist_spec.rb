require "rails_helper"

describe Playlist do
  let (:playlist) {Playlist.new(title: "Nature Hike", creator_id: 1, spotify_id: 2)}

  it "has a title" do
    expect(playlist.title).to eq "Nature Hike"
  end

  it "has a creator_id" do
    expect(playlist.creator_id).to eq 1
  end

  it "has a spotify_id" do
    expect(playlist.spotify_id).to eq 2
  end

  it "will raise validation errors without creator_id" do
    expect{Playlist.create!(title: "Nature Hike", spotify_id: 2)}.to raise_error(ActiveRecord::RecordInvalid)
  end
end

