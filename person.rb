require_relative 'nameable'

class Person < Nameable
  attr_accessor :age, :name

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    super()
    @age = age
    @name = name
    @id = id
    @parent_permission = parent_permission
  end

  # getters for id
  def gets_id
    @id
  end

  def correct_name
    @name
  end

  private

  def of_age?
    age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end
end
