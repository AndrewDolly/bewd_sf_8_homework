class Movie < ActiveRecord::Base
	

	validates :title, :description, presence: true # Movie title can't be empty
	validates :release_year, numericality: { greater_than: 0 }
	validates :description, length: { minimum: 10 }
	


	def self.search(query)
		if query
			Movie.where('title LIKE :query or release_year LIKE :query or description LIKE :query', query: "%#{query}%")
		else
			Movie.all
		end
	end

	def search(query)
	end
end
