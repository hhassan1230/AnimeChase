require 'uri'

class AnimesController < ApplicationController

	def index
	end

	def search
		@anime = Anime.new
	end

	def create
  	@search_input = params["anime"]["title"].gsub(" ", "-").downcase
		@response = Unirest.get "https://hummingbirdv1.p.mashape.com/anime/#{@search_input}",
  headers:{
    "X-Mashape-Key" => ENV["HUMM_API_KEY"],
    "Accept" => "application/json"
  }
	  unless @response.headers[:status] == "404 Not Found"
			@anime = Anime.create(title: @response.body["title"], 
				description: @response.body["synopsis"], 
				score: @response.body["community_rating"],
				img_url: @response.body["cover_image"])
			#build genres here
			render "show"
	  end
	end

	def show
		
	end

end
