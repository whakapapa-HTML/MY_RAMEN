class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_genre, onlt: [:show, :edit, :update, :destroy]

  def new
    @genre = Genre.new
  end

  def index
    @genres = Genre.all
  end

  def show
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      redirect_to admin_genre_path(@genre.id)
    end
  end

  def destroy
    @genre.destroy
    redirect_to admin_genres_path
  end

  private

   def genre_params
     params.require(:genre).permit(:name, :genre_image)
   end

   def set_genre
     @genre = Genre.find(params[:id])
   end

end
