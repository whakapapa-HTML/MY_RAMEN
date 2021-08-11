class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer  :recipe_id,  null: false
      t.integer  :user_id,    null: false
      t.string   :title,      null: false
      t.text     :body,       null: false
      t.float    :evaluation, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.timestamps
    end
  end
end
