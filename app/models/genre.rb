class Genre < ActiveRecord::Base
  has_many :genre_animes
  has_many :animes, through: :genre_animes
end
