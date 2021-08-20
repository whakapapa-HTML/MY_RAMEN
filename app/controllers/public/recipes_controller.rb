class Public::RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:genre, :search, :index]
  before_action :set_recipe, only: [:show, :edit, :update]
  impressionist :actions=> [:show], :unique => [:impressionable_id, :ip_address]

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
  end

  def update
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
    @recipes = Recipe.search(params[:keyword]).page(params[:page]).per(10)
    @content = params[:keyword]
  end

  def ranking
    @genres = Genre.all
    # 内部結合(合致しないレコードは排除)joinsによってレシピとブックマークを合体させる
    # groupメソッドによって、ブックマークに紐づいたrecipe_idをまとめている
    # orderメソッドによって、レコードの多い順(降順)に並び替える
    @all_ranks = Recipe.joins(:bookmarks).group("bookmarks.recipe_id").order('count(bookmarks.recipe_id) desc')
  end

  def raty_ranking
    @genres = Genre.all
    @recipes = Recipe.all
    @raty_ranks = Recipe.select('recipes.*').genre_ranking


    #avgreviw = Review.select('recipe_id,avg(evaluation) as avg').group('recipe_id')
    #@raty_ranks = Recipe.joins(avgreviw.recipe_id = id).select('Recipe.*').order('avgreviw.avg desc')

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
        ingredients_attributes: [:id, :name, :amount, :per_amount, :_destroy],
        procedures_attributes: [:id, :explanation, :procedure_image, :procedure_image_cache, :_destroy]
    )
    end

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end


end
