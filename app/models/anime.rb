class Anime < ActiveRecord::Base
	has_many :genre_animes
  has_many :genres, through: :genre_animes
  
  has_many :saved_animes
  has_many :users, through: :saved_animes
  
	def self.discover
    self.all.sample
	end

	def self.find_date_array
		# binding.pry
		# a = self.where(starting_date: last_year..next_year)
	end
	
end
