require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rentals(rental)
    @rentals << rental unless @rentals.include?(rental)
    rental.book = self
  end
end
