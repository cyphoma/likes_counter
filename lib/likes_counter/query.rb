require "singleton"
require "uri"
require "open-uri"
require "json"

module LikesCounter

  class Query
    include Singleton

    BASE_QUERY = "select page_id, name, fan_count from page where"
    BASE_URL = "https://api.facebook.com/method/fql.query?query="
    DEFAULT_FORMAT = "json"

    def pages_by_id(*ids)
      results = JSON.parse(open(construct_uri('page_id', ids)) { |io| io.read })
      results.map do |entry|
        page = Page.new
        page.id = entry["page_id"]
        page.name = entry["name"]
        page.likes = entry["fan_count"]

        page
      end
    end

    private

    def construct_uri(filter, *values)
      query = "#{BASE_QUERY} #{filter} IN (#{values.join(', ')})"
      "#{BASE_URL}#{URI::encode(query)}&format=#{DEFAULT_FORMAT}"
    end

  end

end
