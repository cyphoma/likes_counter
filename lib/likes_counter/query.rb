require "uri"
require "open-uri"
require "json"

module LikesCounter

  class Query

    BASE_URL = "https://graph.facebook.com"
    FIELDS = %w(id name fan_count)
    DEFAULT_FORMAT = "json"

    def initialize(api_token, api_version = 'v2.7')
      @api_token = api_token
      @api_version = api_version
    end

    def pages_by_id(*ids)
      results = JSON.parse(open(construct_uri('ids', ids)) { |io| io.read })
      results.map do |result|
        entry = result[1]

        page = Page.new
        page.id = entry["id"]
        page.name = entry["name"]
        page.likes = entry["fan_count"]

        page
      end
    end

    private

    def construct_uri(filter, *values)
      query = "#{filter}=#{values.join(',')}&fields=#{FIELDS.join(',')}"
      "#{BASE_URL}/#{@api_version}/?#{query}&format=#{DEFAULT_FORMAT}&access_token=#{@api_token}"
    end

  end

end
