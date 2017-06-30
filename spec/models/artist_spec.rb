require "rails_helper"

RSpec.describe Artist, type: :model do
  context ".search" do
    before do
      @andy = Artist.create!(name: "Andy Matthews", description: "He is your man", tag_list: "musician, ambient, independent")
      @dave = Artist.create!(name: "Dave Whorl", description: "Sick Moves!!", tag_list: "dance, independent")
      @philip = Artist.create!(name: "Philip Matthews", description: "Sick Moves!!", tag_list: "canvas, street art")
    end

    it "can search by name" do
      expect(Artist.search("xyz")).to match_array([])
      expect(Artist.search("Andy")).to match_array([@andy])
      expect(Artist.search("Dave")).to match_array([@dave])
      expect(Artist.search("Matthews")).to match_array([@andy, @philip])
    end

    it "can search through tags" do
      expect(Artist.search("dance").to_a).to eq([@dave])
      expect(Artist.search("independent").to_a).to eq([@andy, @dave])
    end
  end
end
