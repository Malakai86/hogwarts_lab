require_relative('../db/sql_runner')

class House

  attr_reader  :name
  attr_accessor :student_id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @student_id = options['student_id'].to_i

  end


def save()
    sql = "INSERT INTO hogwarts
    (
      name,
      student_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING *"
    values = [@name @student_id]
    house_data = SqlRunner.run(sql, values)
    @id = house_data.first()['id'].to_i
  end

  def student
    sql = "SELECT *
    FROM students
    WHERE student.id = $1"
    values = [@student_id]
    student_data = SqlRunner.run(sql, values)
    student = Customer.map_items(student_data).first
    return student
  end
end
