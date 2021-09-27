class UnsplashService
  def self.get_data(url)
    Faraday.new(url)
  end

  def self.city_photo(location)
    response = get_data("https://api.unsplash.com/search/photos").get do |f|
      f.params['client_id'] = ENV['unsplash_key']
      f.params['query'] = location
      f.params['page'] = 1
      f.params['per_page'] = 1
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end