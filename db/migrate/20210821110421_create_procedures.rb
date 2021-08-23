class CreateProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :procedures do |t|
      t.integer :recipe_id, null: false
      t.text :explanation, null: false
      t.string :procedure_image
      t.timestamps
    end
  end
end
