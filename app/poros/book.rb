class Book
  attr_reader :total_books,
              :isbn,
              :title,
              :publisher
  def initialize(book_info, total)
    @total_books = total
    @isbn = book_info[:isbn]
    @title = book_info[:title]
    @publisher = book_info[:publisher]
  end
end