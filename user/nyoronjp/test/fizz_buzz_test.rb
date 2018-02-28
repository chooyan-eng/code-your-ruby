require 'minitest/autorun'
require './lib/fizz_buzz'

class TestFizzBuzz < Minitest::Test
  def test_fizz_buzz
    assert_equal '1', fizz_buzz(1)
    assert_equal '2', fizz_buzz(2)
    assert_equal 'Fizz', fizz_buzz(3)
    assert_equal '4', fizz_buzz(4)
    assert_equal 'Buzz', fizz_buzz(5)
    assert_equal 'Fizz', fizz_buzz(6)
    assert_equal '7', fizz_buzz(7)
    assert_equal '8', fizz_buzz(8)
    assert_equal 'Fizz', fizz_buzz(9)
    assert_equal 'Buzz', fizz_buzz(10)
    assert_equal '11', fizz_buzz(11)
    assert_equal 'Fizz', fizz_buzz(12)
    assert_equal '13', fizz_buzz(13)
    assert_equal '14', fizz_buzz(14)
    assert_equal 'FizzBuzz', fizz_buzz(15)
  end

  def test_zero
    assert_equal '0', fizz_buzz(0)
  end

  def test_negative_number
    assert_equal '-1', fizz_buzz(-1)
    assert_equal 'Fizz', fizz_buzz(-3)
    assert_equal 'Buzz', fizz_buzz(-5)
    assert_equal 'FizzBuzz', fizz_buzz(-15)
  end
end
