class ChangeColumnToRecipe < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :recipe_image, :string, null: false
  end
end
