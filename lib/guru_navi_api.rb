class GuruNaviApi
  include HTTParty
  base_uri 'http://api.gnavi.co.jp'
  KEY_ID = ENV["GURU_NAVI_KEY_ID"]

  def self.restaurants
    res = get("/RestSearchAPI/20150630", default_query.merge!(lunch: 1))
    JSON.parse(res.body)["rest"]
  end

  private
    def self.default_query
      { query: { keyid: KEY_ID, format: "json" } }
    end
end
