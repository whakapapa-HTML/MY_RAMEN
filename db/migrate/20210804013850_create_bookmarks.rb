class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.integer  :user_id   , null: false
      t.integer  :recipe_id , null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.timestamps
    end
  end
end
