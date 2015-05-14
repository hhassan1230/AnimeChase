require 'google/api_client'
class YoutubeLoad
	attr_reader :youtube, :client
	def initialize
      @client = Google::APIClient.new(:key => ENV['youtube_id'],
                              :authorization => nil,
       :application_name => "animechase")
      @youtube = @client.discovered_api('youtube', 'v3')
   end

	def search(query)
      options = {}
      options[:q] ||= "anime #{query}"
      options[:part] = 'snippet'
      options[:maxResults] = 6
      results = @client.execute!(
      api_method: @youtube.search.list,
      parameters: options
      )
      JSON.parse(results.body)['items'].map do |id|
        id['id']['videoId']
      end
    end

end