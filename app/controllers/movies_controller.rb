class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create 
    the_movie = Movie.new 
    the_movie.title = params.fetch("title_field")
    the_movie.year = params.fetch("year_field")
    the_movie.duration = params.fetch("duration_field")
    the_movie.description = params.fetch("description_field")
    the_movie.image = params.fetch("image_field")
    the_movie.director_id = params.fetch("director_id_field")
    the_movie.save

    redirect_to("/movies")
  end 

  def destroy
    the_id = params.fetch("an_id")

    matching_records = Movie.where({ :id => the_id })

    the_movie = matching_records.at(0)

    the_movie.destroy

    redirect_to("/movies")
  end

  def update
    m_id = params.fetch("the_id")
    matching_relation = Movie.where({ :id => m_id })
    the_movie = matching_relation.at(0)
    the_movie.title = params.fetch("title_field")
    the_movie.year = params.fetch("year_field")
    the_movie.duration = params.fetch("duration_field")
    the_movie.description = params.fetch("description_field")
    the_movie.image = params.fetch("image_field")
    the_movie.director_id = params.fetch("director_id_field")
    the_movie.save

    redirect_to("/movies/#{the_movie.id}")
  end 

end
