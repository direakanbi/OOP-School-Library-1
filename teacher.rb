require './person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: true)
    @specialization = specialization
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def can_use_services?
    true
  end
end

teacher = Teacher.new('Code Instructor', 25, 'Dev. Dire Akanbi', parent_permission: false)

puts teacher.can_use_services?
