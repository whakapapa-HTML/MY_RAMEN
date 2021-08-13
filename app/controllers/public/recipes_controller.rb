class Public::RecipesController < ApplicationController
  before_action :authenticate, except: [:genre, :search]

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.procedures.build
  end

  def index
    @recipes = Recipe.all.order(created_at: :desc)
  end

  def genre
    @genre = Genre.find(params[:id])
    @recipes = Recipe.where(genre_id: @genre.id)
  end

  def show
    @review = Review.new
    @recipe = Recipe.find(params[:id])
    @reviews = @recipe.reviews.all
    @rate_avg = @reviews.average(:evaluation).to_i
    # 星の表示
    if current_user
      @reviews = @recipe.reviews.find_by(user_id: current_user.id)
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
      # 一人当たりの分量を保存する
    @recipe.ingredients.each do |ingredient|
      ingredient.per_amount = ingredient.amount.to_f / params[:recipe][:serving].to_f
    end

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
    @recipe = Recipe.find(params[:id])
    # 人数分あたりの分量を算出する
    @recipe.ingredients.each do |ingredient|
      ingredient.amount = params[:recipe][:serving].to_f * ingredient.per_amount
      ingredient.per_amount = ingredient.amount.to_f / params[:recipe][:serving].to_f
      ingredient.save
    end

    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe.id)
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find_by(params[:recipe_id]).destroy
    redirect_to user_path(current_user)
  end

  def search
    @genres = Genre.all
    @recipes = Recipe.search(params[:keyword])
  end

  def ranking
    @genres = Genre.all
    # 内部結合(合致しないレコードは排除)joinsによってクエリの消費を抑える
    # groupメソッドによって、ブックマークに紐づいたrecipe_idをまとめている
    # orderメソッドによって、レコードの多い順(降順)に並び替える
    @all_ranks = Recipe.joins(:bookmarks).group("bookmarks.recipe_id").order("count(bookmarks.recipe_id) DESC")
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
        ingredients_attributes: [:id, :name, :amount, :per_amount, :_destroy],
        procedures_attributes: [:id, :explanation, :procedure_image, :procedure_image_cache, :_destroy]
    )
    end



end
