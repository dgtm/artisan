require "rails_helper"

RSpec.describe ArtistsController, type: :controller do
  describe "GET #index" do
    it "responds successfully" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the artists into @artists" do
      artist1, artist2 = Artist.create!, Artist.create!
      get :index

      expect(assigns(:artists)).to match_array([artist1, artist2])
    end

    it "Given a search term, it only loads matching @artists" do
      artist1, artist2 = Artist.create!(name: 'Dave'), Artist.create!
      get :index, params: { search: 'Dave' }

      expect(assigns(:artists)).to match_array([artist1])
    end
  end
end
