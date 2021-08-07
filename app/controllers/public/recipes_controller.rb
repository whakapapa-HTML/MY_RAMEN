class Public::RecipesController < ApplicationController


  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.procedures.build
  end

  def index
  end

  def show
    @recipe = Recipe.find(params[:id])

  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = "投稿に成功しました！"
      redirect_to recipe_path(@recipe.id)
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update(recipe_params)
    redirect_to recipe_path(recipe)
  end

  def destroy
    @recipe = Recipe.find_by(params[:recipe_id]).destroy
    redirect_to user_path(current_user)
  end

  private

    def recipe_params
      params.require(:recipe).permit(
        :user_id,
        :genre_id,
        :name,
        :introduction,
        :serving,
        :recipe_image,
        :recipe_image_cache,
        ingredients_attributes: [:id, :name, :amount, :_destroy],
        procedures_attributes: [:id, :explanation, :procedure_image, :procedure_image_cache, :_destroy]
    )
    end



end
