class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :description
      t.float :latitude
      t.float :longitude
      t.string :image_url

      t.timestamps
    end
  end
end
