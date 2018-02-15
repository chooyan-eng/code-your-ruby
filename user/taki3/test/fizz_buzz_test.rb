require 'minitest/autorun'

require_relative '../lib/fizz_buzz'

class FizzBuzzTest < Minitest::Test
  def test_fizz_buzz
    assert_equal '0', fizz_buzz(0)
    assert_equal 'Fizz', fizz_buzz(3)
    assert_equal 'Buzz', fizz_buzz(5)
    assert_equal 'FizzBuzz', fizz_buzz(15)
    assert_equal 'Fizz', fizz_buzz(18)

    assert_raises(ArgumentError) { fizz_buzz('wrong_number') }
  end
end
