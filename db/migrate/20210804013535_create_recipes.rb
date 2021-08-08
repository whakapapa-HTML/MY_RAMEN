class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer  :user_id,      null: false
      t.integer  :genre_id,     null: false

      t.string   :name,         null: false
      t.text     :introduction, null: false
      t.integer  :serving,      null: false
      t.datetime :created_at,   null: false
      t.datetime :updated_at,   null: false
      
      t.timestamps
    end
  end
end
