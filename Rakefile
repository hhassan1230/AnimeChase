# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks


require 'rake'
namespace :seed do

  task :populate_genres => :environment do
    Genre.destroy_all
    File.read("seed.txt").each_line do |line|
      Genre.create('name' => line.chop)
    end
  end

  task :populate_db => :environment do
    (1..11_000).each do |i|
      response = get_anime(i)

      if response.headers[:status] == "200 OK"
        anime = Anime.create
        anime.title = response.body["title"]
        anime.slug = response.body['slug']
        anime.description = response.body["synopsis"]
        anime.score = response.body["community_rating"]
        anime.img_url = response.body["cover_image"]
        anime.save
        response.body['genres'].each do |genre|
          genre_anime = GenreAnime.new
          genre_anime.genre_id = Genre.find_by('name' => genre['name']).id
          genre_anime.anime_id = anime.id
          genre_anime.save
        end
      end
    end
  end
end


  def get_anime(search_input)
    @response = Unirest.get "https://hummingbirdv1.p.mashape.com/anime/#{search_input}",
    headers:{
      "X-Mashape-Key" => ENV["HUMM_API_KEY"],
      "Accept" => "application/json"
    }
  end
