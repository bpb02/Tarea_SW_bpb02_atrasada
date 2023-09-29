class MoviesController < ApplicationController

    
  # GET /movies/sinopsis/:keyword
  def search_by_sinopsis
    keyword = params[:keyword]
    @movies = Movie.where("sinopsis LIKE ?", "%#{keyword}%")
    render json: @movies
  end
    def set_director
        @director = Director.find(params[:id])
    end

    def director_params
        params.require(:director).permit(:name, :age, :country, :has_oscars)
    end

    def movie_params
        params.require(:movie).permit(:title, :sinopsis, :duration, :premiere)
    end
end
