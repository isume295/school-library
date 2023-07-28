require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_accessor :age, :name, :rental

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @age = age
    @name = name
    @id = Random.rand(1...1000)
    @parent_permission = parent_permission
    @rentals = []
  end

  # getters for id
  def gets_id
    @id
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end
end
