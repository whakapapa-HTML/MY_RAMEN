class CreateProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :procedures do |t|
      t.integer  :recipe_id,          null: false
      t.text     :explanation,        null: false
      t.datetime :created_at,         null: false
      t.datetime :updated_at,         null: false
      t.timestamps
    end
  end
end
