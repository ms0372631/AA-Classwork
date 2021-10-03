# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer

require_relative './sqlzoo.rb'

def example_query
  execute(<<-SQL)
    SELECT
      *
    FROM
      movies
    WHERE
      title = 'Doctor No'
  SQL
end

def films_from_sixty_two
  # List the films where the yr is 1962 [Show id, title]
  execute(<<-SQL)
    SELECT
      id, title
    FROM
      movies
    WHERE
      yr = 1962;
  SQL
end

def year_of_kane
  # Give year of 'Citizen Kane'.
  execute(<<-SQL)
    SELECT
      yr
    FROM
      movies
    WHERE
      title = 'Citizen Kane'
  SQL
end

def trek_films
  # List all of the Star Trek movies, include the id, title and yr (all of
  # these movies include the words Star Trek in the title). Order results by
  # year.
  execute(<<-SQL)
    SELECT
      id, title, yr
    FROM
      movies
    WHERE
      title LIKE '%Star Trek%'
    ORDER BY
      yr;

  SQL
end

def films_by_id
  # What are the titles of the films with id 1119, 1595, 1768?
  execute(<<-SQL)
    SELECT
      title
    FROM
      movies
    WHERE
      id IN (1119, 1595, 1768);
  SQL
end

def glenn_close_id
  # What id number does the actress 'Glenn Close' have?
  execute(<<-SQL)
    SELECT
      id
    FROM
      actors
    WHERE
      name = 'Glenn Close';

  SQL
end

def casablanca_id
  # What is the id of the film 'Casablanca'?
  execute(<<-SQL)
    SELECT
      id
    FROM
      movies
    WHERE
      title = 'Casablanca';

  SQL
end

def casablanca_cast
  # Obtain the cast list for 'Casablanca'. Use the id value that you obtained
  # in the previous question directly in your query (for example, id = 1).
  execute(<<-SQL)
    SELECT
      actors.name
    FROM
      castings
    JOIN
      actors
    ON 
      castings.actor_id = actors.id
    WHERE
      movie_id = (
        SELECT
          id
        FROM
          movies
        WHERE
          title = 'Casablanca'
      );
  SQL
end

def alien_cast
  # Obtain the cast list for the film 'Alien'
  execute(<<-SQL)
    SELECT
      actors.name
    FROM
      castings
    JOIN
      actors
    ON 
      castings.actor_id = actors.id
    WHERE
      movie_id = (
        SELECT
          id
        FROM
          movies
        WHERE
          title = 'Alien'
      );

  SQL
end
