class Anime < ActiveRecord::Base
	has_many :genre_animes
  has_many :genres, through: :genre_animes
	# validates :title, presence: true

	def self.discover
		amount_in_db = self.all.count  
		self.all[rand(0..amount_in_db)]
	end
	
end
