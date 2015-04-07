class Anime < ActiveRecord::Base
	has_many :genre_animes
  has_many :genres, through: :genre_animes
	# validates :title, presence: true
	
end
