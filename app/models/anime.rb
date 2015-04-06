class Anime < ActiveRecord::Base
	has_many :genres
	# validates :title, presence: true
	
end
