require_relative('../models/students')
require_relative('../models/houses')

student1 = Student.new({
  "first_name" => "Harry",
  'last_name' => "Potter",
  "house" => "Gryffindor",
  "age" => 16
  })

student2 = Student.new({
  "first_name" => "Hermione",
  "last_name" => "Granger",
  "house" => "Gryffindor",
  "age" => 16
  })

student3 =  Student.new({
  "first_name" => "Draco",
  "last_name" => "Malfoy",
  "house" => "Slytherin",
  "age" => 16

  })

student1.save()
student2.save()
student3.save()

house1 = House.new({
  "name" => "Gryffindor",
  "student-id" => student1.id
  })



house2 = House.new({
  "name" => "Slytherin"
  "student_id" => student3.id
  })

house1.save()
house2.save()
