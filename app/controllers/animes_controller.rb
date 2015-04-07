require 'uri'

class AnimesController < ApplicationController

	def index
	end

	def search
		@anime = Anime.new
	end

	def create
  	@search_input = params["anime"]["title"].gsub(" ", "-").downcase
get_anime(@search_input)


	  if @response.headers[:status] == "200 OK"
			@anime = Anime.create(title: @response.body["title"], 
				description: @response.body["synopsis"], 
				score: @response.body["community_rating"],
				img_url: @response.body["cover_image"])
			#build genres here
			render "show"

    else
    @anime = Anime.new
    @error = "No results found, try again."
    render "search"

	  end

	end

	def show
		
	end


  def get_anime(search_input)
        @response = Unirest.get "https://hummingbirdv1.p.mashape.com/anime/#{search_input}",
      headers:{
        "X-Mashape-Key" => ENV["HUMM_API_KEY"],
        "Accept" => "application/json"
      }
  end
end
