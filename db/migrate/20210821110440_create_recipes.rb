class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :serving, null: false
      t.string :recipe_image, null: false
      t.integer :impressions_count, default: 0, null: false
      t.timestamps
    end
  end
end
