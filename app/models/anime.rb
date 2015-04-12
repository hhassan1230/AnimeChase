class Anime < ActiveRecord::Base
	has_many :genre_animes
  has_many :genres, through: :genre_animes
  
  has_many :saved_animes
  has_many :users, through: :saved_animes
  
	def self.discover
    self.all.sample
	end

	def self.find_date_array
		this_year = Date.today
		next_year = Date.today + 500
		last_year = Date.today - 440
		# binding.pry
		self.where(starting_date: last_year..next_year)
	end

	def filter(anime)
		@anime.genres.each do |genre|
      if genre.name == "Hentai" || genre.name == "Yuri" || genre.name == "Yaoi"
        
      end
    end	
	end
	
end
