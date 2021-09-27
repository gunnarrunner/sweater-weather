class LibrarySerializer
  include FastJsonapi::ObjectSerializer
  
  def self.book_information(forecast, location, books)
    {
      data: {
        id: nil,
        type: "books",
        attributes: {
          destination: location,
          forecast: {
            summary: forecast.conditions,
            temperature: forecast.temperature
          },
          total_books_found: books[0].total_books,
          books: 
            books.map do |book|
              {
                isbn: book.isbn,
                title: book.title,
                publisher: book.publisher
              }
            end
          }
        }
      }
  end
end