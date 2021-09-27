class LibraryFacade
  def self.books(search_params, quantity)
    service = LibraryService.books_info(search_params, quantity)

    total = service[:numFound]
    service[:docs].map do |hash|
      Book.new(hash, total)
    end
  end
end