class AddGenreImageToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :genre_image, :string
  end
end
