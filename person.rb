class Person
  def initialize(id, age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @id = id
    @parent_permission = parent_permission
  end

  # getters
  def gets_id
    @id
  end

  def gets_name
    @name
  end

  def gets_age
    @age
  end

  # setters
  def sets_age(age)
    @age = age
  end

  def sets_name(name)
    @age = name
  end

  private

  def of_age?
    age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end
end
