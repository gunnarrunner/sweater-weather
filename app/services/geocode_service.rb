class GeocodeService
  def self.get_data(url)
    Faraday.new(url)
  end

  def self.location(location)
    response = get_data("http://www.mapquestapi.com/geocoding/v1/address").get do |f|
      f.params['key'] = ENV['map_quest_key']
      f.params['location'] = location
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end