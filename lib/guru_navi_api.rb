class GuruNaviApi
  include HTTParty
  base_uri 'http://api.gnavi.co.jp'
  KEY_ID = ENV["GURU_NAVI_KEY_ID"]

  def self.restaurants(options = {})
    query = default_query.merge!(lunch: 1).merge!(options)
    res = get("/RestSearchAPI/20150630", query: query)
    data_list = JSON.parse(res.body)["rest"]
    data_list.map do |data|
      Restaurant.build_from_api(data.with_indifferent_access)
    end
  end

  private
    def self.default_query
      { keyid: KEY_ID, format: "json" }
    end
end
