class GuruNaviApi
  include HTTParty
  base_uri 'http://api.gnavi.co.jp'
  KEY_ID = ENV["GURU_NAVI_KEY_ID"]

  def self.restaurants(query: {})
    merged_query = default_query.merge!(lunch: 1).merge!(query)
    res = get("/RestSearchAPI/20150630", query: merged_query)
    data_list = JSON.parse(res.body)["rest"] || []
    data_list.map do |data|
      Restaurant.build_from_api(data.with_indifferent_access)
    end
  end

  def self.areas(query: {})
    merged_query = default_query.merge!(query)
    res = get("/master/AreaSearchAPI/20150630", query: merged_query)
    data_list = JSON.parse(res.body)["area"] || []
    data_list.map(&:with_indifferent_access)
  end

  def self.prefectures(query: {})
    merged_query = default_query.merge!(query)
    res = get("/master/PrefSearchAPI/20150630", query: merged_query)
    data_list = JSON.parse(res.body)["pref"] || []
    data_list.map(&:with_indifferent_access)
  end

  def self.large_gareas(pref_code: nil, query: {})
    merged_query = default_query.merge!(query)
    res = get("/master/GAreaLargeSearchAPI/20150630", query: merged_query)
    data_list = JSON.parse(res.body)["garea_large"] || []
    data_list.keep_if{|d| d["pref"]["pref_code"] == pref_code } if pref_code.present?
    data_list.map(&:with_indifferent_access)
  end

  def self.middle_gareas(pref_code: nil, query: {})
    merged_query = default_query.merge!(query)
    res = get("/master/GAreaMiddleSearchAPI/20150630", query: merged_query)
    data_list = JSON.parse(res.body)["garea_middle"] || []
    data_list.keep_if{|d| d["pref"]["pref_code"] == pref_code } if pref_code.present?
    data_list.map(&:with_indifferent_access)
  end

  def self.small_gareas(pref_code: nil, query: {})
    merged_query = default_query.merge!(query) || []
    res = get("/master/GAreaSmallSearchAPI/20150630", query: merged_query)
    data_list = JSON.parse(res.body)["garea_small"]
    data_list.keep_if{|d| d["pref"]["pref_code"] == pref_code } if pref_code.present?
    data_list.map(&:with_indifferent_access)
  end

  private

  def self.default_query
    { keyid: KEY_ID, format: "json" }
  end
end
