class Anime < ActiveRecord::Base
	has_many :genre_animes
  has_many :genres, through: :genre_animes
  
  has_many :saved_animes
  has_many :users, through: :saved_animes
	# validates :title, presence: true

	def self.discover
    self.all.sample
	end
	
end
