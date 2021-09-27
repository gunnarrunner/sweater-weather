class LibraryService
  def self.get_data(url)
    Faraday.new(url)
  end

  def self.books_info(location, limit)
    response = get_data("http://openlibrary.org/search.json").get do |f|
      f.params['q'] = location
      f.params['limit'] = limit
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end