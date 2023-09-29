class DirectorsController < ApplicationController
    before_action :set_director, only: [:show, :update, :destroy, :movies, :create_movie, :update_movie]
    
    # GET /directors
    def index
      @all_directors = Director.all
      render json:@all_directors
    end

    # GET /director/:id
    def show
        @director = Director.find(params[:id])
        render json: @director
    end
    
    # POST /directors
    def create
      @director = Director.new(director_params)
  
        if @director.save
          render json: @director, status: :created
        else
          render json: @director.errors, status: :unprocessable_entity
        end
    end
    
    # DELETE /director/:id
    def destroy
        @director = Director.find(params[:id])
        @director.destroy
        head :no_content
    end
    
    # DELETE /directors
    def destroy_all
      Director.destroy_all
        head :no_content
    end
    
    # GET /directors/oscars
    def oscars
      @directors_with_oscars = Director.where(has_oscars: true)
        render json: @directors_with_oscars
    end
  
      # GET /director/:director_id/movies
    def movies
      @movies = @director.movies
        render json: @movies
    end

    # GET /director/:director_id/movies
    def movies
        @movies = @director.movies
        render json: @movies
    end

    # POST /director/:director_id/movies
    def create_movie
        @movie = @director.movies.build(movie_params)
        if @movie.save
            render json: @movie, status: :created
        else
            render json: @movie.errors, status: :unprocessable_entity
        end
    end

    # PATCH /director/:director_id/movies/:movie_id
    def update_movie
        @movie = @director.movies.find(params[:movie_id])
        if @movie.update(movie_params)
            render json: @movie
        else
            render json: @movie.errors, status: :unprocessable_entity
        end
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
    