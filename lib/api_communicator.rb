require 'rest-client'
require 'json'
require 'pry'

def character_films(character_hash, character)
  films_array = []
  character_hash["results"].each do |characters|
    if characters["name"].downcase == character
    films_array = characters["films"]
    end
  end
  films_array
end

def character_film_hash(films_array)
  films_hash = films_array.collect do |film|
    JSON.parse(RestClient.get(film))
  end

  films_hash
end

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  films_array = character_films(character_hash, character)
  films_hash = character_film_hash(films_array)
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
  films_hash
end
# films_hash = get_character_movies_from_api("Luke Skywalker")
def parse_character_movies(films_hash)
  films_hash.each_with_index do |film, idx|
    puts "#{idx+1}: #{film["title"]}"
  end
   #some iteration magic and puts out the movies in a nice list
end
# parse_character_movies(films_hash)
def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end
## BONUS
# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
