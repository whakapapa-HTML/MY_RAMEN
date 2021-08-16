class ChangeColumnToGenre < ActiveRecord::Migration[5.2]
  def change
    change_column :genres, :genre_image, :string, null: false
  end
end
