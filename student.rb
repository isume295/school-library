require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_reader :classroom

  def initialize(classroom1, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom(classroom1)
  end

  def classroom=(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    @age
  end
end
