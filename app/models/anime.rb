class Anime < ActiveRecord::Base
	has_many :genre_animes
  has_many :genres, through: :genre_animes
  
  has_many :saved_animes
  has_many :users, through: :saved_animes

  UNSAFE_GENRES = ["Hentai", "Yuri", "Yaoi"]
  
	def self.discover
    anime = self.all.sample
    while unsafe_genre?(anime)
    	anime = self.all.sample
    end
	  anime
    
	end

	def self.find_date_array
		this_year = Date.today
		next_year = Date.today + 500
		last_year = Date.today - 440
		# binding.pry
		self.where(starting_date: last_year..next_year)
	end

	def self.unsafe_genre?(anime)
		anime.genres.any? {|genre| UNSAFE_GENRES.include?(genre.name) } 
	end

	def unsafe_genres
		UNSAFE_GENRES
	end
	
end
