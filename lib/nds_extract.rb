require 'directors_database'
require 'pry'


# Write a method that, given an NDS creates a new Hash
# The return value should be like:
#
# { directorOne => allTheMoneyTheyMade, ... }

def directors_totals(nds)
	result = {}
	# First we must iterate through an Array of Hashes
	outer_shell = 0
	while outer_shell < nds.length do
		# Then we begin to iterate through the :movies tag paired alongside :name, remember, this tag points to an AoH.
		director = nds[outer_shell][:name] # Save the :name location.
		iter_movies = 0
		gross_values = [] # Vessel for :worldwide_gross.
		while iter_movies < nds[outer_shell][:movies].length do
			# Finally we have access to the lowest level keys(:title,:studio,:worldwide_gross,:release_year)
			inner_key = nds[outer_shell][:movies][iter_movies] # Save "key" to access other values if needed.
			gross_values << inner_key[:worldwide_gross] # Shovel values into vessel for extraction.
			iter_movies += 1
		end
		# Add saved director location and values vessel into Hash form. Preparing for return.
		result.store(director, gross_values.sum)
		outer_shell += 1
	end
	result
end

# Find a way to accumulate the :worldwide_grosses and return that Integer
# using director_data as input
def gross_for_director(director_data)
  gross_values = []
  movie_num = 0
  while movie_num < director_data[:movies].length
    gross_values << director_data[:movies][movie_num][:worldwide_gross]
    movie_num += 1
  end
  gross_values.sum
end
