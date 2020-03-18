require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../students')

class TestStudent < MiniTest::Test

  def setup
    options = {"id" => 1, "first_name" => "Harry", "last_name" => "Potter",
    "house" => "Gryffindor", "age" => 16}

    @students = Student.new(options)
  end

  def test_first_name()
    result = @students.first_name()
    assert_equal("Harry", result)
  end

  def test_last_name()
    result = @students.last_name()
    assert_equal("Potter", result)
  end

  def test_house()
    result = @students.house()
    assert_equal("Gryffindor", result)
  end

  def test_age()
    result = @students.age()
    assert_equal(16, result)
  end

  def test_full_name()
    result = @students.full_name()
    assert_equal("Harry Potter", result)
  end
end
