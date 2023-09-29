Rails.application.routes.draw do
  #metodos de la parte 1
  get '/directors', to: "directors#index"
  post '/directors', to: "directors#create"
  get "/director/:id", to: "directors#show" 
  
  delete "/director/:id", to: "directors#destroy" 
  delete "/directors", to: "directors#destroy_all"
  get '/directors/oscars', to: "directors#oscars"

  #metodos de la parte 2
  get "/director/:id/movies", to: "directors#movies"
  post "/director/:id/movies", to: "directors#create_movie"
  patch "/director/:id/movies/:movie_id", to: "directors#update_movie"
  get "/movies/sinopsis/:keyword", to: "movies#search_by_sinopsis"
  #patch "/directors/:id", to: "directors#update"

  #get 'movies', to: 'directors#movies'
  #post 'movies', to: 'directors#create_movie'
  #delete 'destroy_all', to: 'directors#destroy_all'
  #get 'oscars', to: 'directors#oscars
end
