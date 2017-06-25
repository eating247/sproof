class MoviesController < ApplicationController
  def index
    if params[:search].present?
      @movies = Movie.search(params[:search])
    else
      @movies = Movie.all
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end
  
  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    if @movie.destroy
      redirect_to movies_path
    else
      render :show
    end
  end

  def search
    @movies = Movie.search_name(params[:query])
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :storyline, :release, :link, :genre_id)
  end
end
