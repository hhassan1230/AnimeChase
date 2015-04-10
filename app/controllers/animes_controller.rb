require 'uri'

class AnimesController < ApplicationController

	def index
	end

	def search
		@anime = Anime.new
	end

	def create
    search_string = (params["anime"]["title"] || params["anime"])
  	@search_input = search_string.gsub(" ", "-").downcase
    get_anime(@search_input)

	  if @response.headers[:status] == "200 OK"
			@anime = Anime.create(title: @response.body["title"], 
				description: @response.body["synopsis"], 
				score: @response.body["community_rating"],
				img_url: @response.body["cover_image"])
      @video_ids = get_youtube_ids(@anime)
			render "show"

    else
      @anime = Anime.new
      @error = "No results found for \"#{params["anime"]["title"]}\"."
      render "search"
	  end
	end

	def random
		@anime = Anime.discover
    @video_ids = get_youtube_ids(@anime)
		render "show"
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

  def animes_in_genre
    @animes_in_genre = Genre.find_by('name' => params['genre']).animes
    # @animes_in_genre.order("genre").page(params[:page])
    # @animes_in_genre.page(params[:page]).order("genre")
    # @animes_in_genre.order("name").page(params[:page])

    # Kaminari.paginate_array(@animes_in_genre).page(params[:page]).per(10)
    # @f = Genre.find_by('name' => params['genre'])
    # @f.order(:created_at).page(params[:page])
    # @genres = Genre.order(:created_at).page(params[:page]).per(2)
    # a = Kaminari.paginate_array(Genre.find_by('name' => params['genre']).animes
    # @genrse = a.order(:name).page(params[:page])
    # @paginatable_array = Kaminari.paginate_array([], total_count: 145).page(params[:page]).per(10)
    @genre = params["genre"]
    @message = "No animes in this genre."
    render "animes_in_genre"
  end

  def add_to_watch_list
    @anime = Anime.find_by(:title => params['save_this_anime'])
    SavedAnime.create(:anime_id => @anime.id, :user_id => current_user.id)
    # get_anime(@anime.slug)
    @video_ids = get_youtube_ids(@anime)
    render :show
  end

  def watchlist
    @animes = current_user.animes
    render :watchlist
  end


  def destroy
    @saved_anime_deleted = SavedAnime.find_by(:anime_id => params["id"])
    @saved_anime_deleted.destroy
    redirect_to "/watchlist"
  end

  def get_youtube_ids(anime)
    @video_ids = []
    list = YoutubeSearch.search("anime #{anime.title}")
    list[0..5].each do |listing|
      @video_ids << listing['video_id']
    end
    return @video_ids
  end
    
end
