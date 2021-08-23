class Public::RecipesController < ApplicationController
  before_action :authenticate_user!, except: %i[genre search index]
  before_action :set_recipe, only: %i[show edit update serving_update]
  impressionist actions: [:show], unique: %i[impressionable_id ip_address]

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.procedures.build
  end

  def genre
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @recipes = Recipe.where(genre_id: @genre.id).page(params[:page]).per(10)
  end

  def show
    # 同じ人がアクセス（同じブラウザからアクセス）した複数回、同じ記事をみた場合は1PVと数える
    @review = Review.new
    @views = @recipe.impressions.size
    @reviews = @recipe.reviews.all
    @rate_avg = @reviews.average(:evaluation).to_f
    # 星の表示
    @reviews = @recipe.reviews.find_by(user_id: current_user.id) if current_user
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      flash[:success] = '投稿に成功しました！'
      redirect_to recipe_path(@recipe.id)
    else
      @recipe.recipe_image.nil?
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update(update_recipe_params)
      redirect_to recipe_path(@recipe.id)
    else
      render :edit
    end
  end
  # 人数を変更すると分量も変更する
  # ４人前で400gだった場合400÷4で100gをper_amountに代入
  def serving_update  # 人数を変更するアクション

    @recipe.ingredients.each do |ingredient|
      per_amount = ingredient.amount / @recipe.serving
      ingredient.amount = per_amount * params[:recipe][:serving].to_f
      ingredient.save
    end

    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    end
  end


  def destroy
    @recipe = Recipe.find_by(params[:recipe_id]).destroy
    redirect_to  my_page_path(current_user)
  end


  def search
    @genres = Genre.all
    @recipes = Recipe.search(params[:keyword]).page(params[:page]).per(10)
    @content = params[:keyword]
  end


  def ranking
    @genres = Genre.all
    # 内部結合(合致しないレコードは排除)joinsによってレシピとブックマークを合体させる
    # groupメソッドによって、ブックマークに紐づいたrecipe_idをまとめている
    # orderメソッドによって、レコードの多い順(降順)に並び替える
    @all_ranks = Recipe.joins(:bookmarks).group('bookmarks.recipe_id').order('count(bookmarks.recipe_id) desc')
  end


  def raty_ranking
    @genres = Genre.all
    @recipes = Recipe.all
    @raty_ranks = Recipe.select('recipes.*').genre_ranking
  end


  def pv_ranking
    @genres = Genre.all
    @pv_ranks = Recipe.find(Impression.group(:impressionable_id).order('count(impressionable_id) desc').pluck(:impressionable_id))
  end


  def genre_ranking
    @genres = Genre.all
    @genre = Genre.find(params[:genre_id])
    @genre_ranks = Recipe.where(genre_id: @genre.id).genre_ranking
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
      ingredients_attributes: %i[name amount per_amount],
      procedures_attributes: %i[explanation procedure_image procedure_image_cache]
    )
  end

  def update_recipe_params
    params.require(:recipe).permit(
      :user_id,
      :genre_id,
      :name,
      :introduction,
      :serving,
      :recipe_image,
      :recipe_image_cache,
      ingredients_attributes: %i[id name amount _destroy ],
      procedures_attributes: %i[id explanation procedure_image procedure_image_cache _destroy]
      )
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end
