class RemoveLatandLonFromArtists < ActiveRecord::Migration[5.1]
  def change
    remove_column :artists, :latitude, :float
    remove_column :artists, :longitude, :float
  end
end
