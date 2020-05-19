# tester_demo.rb
require "minitest/autorun"
require_relative "student"

class StudentTest < Minitest::Test

  def test_student_id_is_integer
    assert_kind_of Integer, get_student_id(2)
  end

# insert a test here for the finding the correct student for id 300

# insert a test here for returning "Not Found" for student with id 800

# insert a test here for finding the correct student name for array position 0


end
