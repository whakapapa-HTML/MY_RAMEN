class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.integer  :recipe_id,  null: false
      t.string   :name,       null: false
      t.float    :amount,     null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.float    :per_amount, null: false
      t.timestamps
    end
  end
end
