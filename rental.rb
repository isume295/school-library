class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    def add_book(book)
      @book = book
      book.rentals << self unless book.rentals.include?(self)
    end

    def add_person(person)
      @person = person
      person.rentals << self unless person.rentals.include?(self)
    end

    # book.rentals << self
    # person.rentals << self
  end
end
