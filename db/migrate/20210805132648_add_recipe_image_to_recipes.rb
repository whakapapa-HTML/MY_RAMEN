class AddRecipeImageToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :recipe_image, :string
  end
end
