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
  end

  def update
  end

  def destroy
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
        ingredients_attributes: [:name, :amount, :_destroy],
        procedures_attributes: [:explanation, :procedure_image, :_destroy]
    )
    end



end
