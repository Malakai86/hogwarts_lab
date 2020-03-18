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
    sql = "INSERT INTO houses
    (
      name,
      student_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING *"
    values = [@name, @student_id]
    house_data = SqlRunner.run(sql, values)
    @id = house_data.first()['id'].to_i
  end

  def house
    sql = "SELECT *
    FROM houses
    WHERE house.id = $1"
    values = [@id]
    student_data = SqlRunner.run(sql, values)
    student = Customer.map_items(student_data).first
    return student
  end

  def self.find( id )
    sql = "SELECT * FROM houses
    WHERE id = $1"
    values = [id]
    student = SqlRunner.run( sql, values )
    result = House.new( house.first )
    return result
  end

  def self.all()
  sql = "SELECT * FROM houses"
  house_data = SqlRunner.run( sql )
  result = house_data.map { |house| House.new( house ) }
  return result
end

def self.map_items(house_data)
  result = house_data.map { |house| House.new( house ) }
  return result
end

end
