require_relative '../lib/fizz_buzz'
require 'minitest/autorun'


# fizz_buzz_問題のテスト
class TestFizzBuzz < Minitest::Test

  # ノーマルパターン
  def test_normal_number
    assert_equal '1', fizz_buzz(1)
    assert_equal '2', fizz_buzz(2)
    assert_equal 'Fizz', fizz_buzz(3)
    assert_equal '4', fizz_buzz(4)
    assert_equal 'Buzz', fizz_buzz(5)
    assert_equal 'FizzBuzz', fizz_buzz(15)
  end

  # アレンジパターン
  def test_arrange_number
    assert_equal '6', fizz_buzz(6, fizz_number: 7, buzz_number: 11)
    assert_equal 'Fizz', fizz_buzz(7, fizz_number: 7, buzz_number: 11)
    assert_equal 'Buzz', fizz_buzz(11, fizz_number: 7, buzz_number: 11)
    assert_equal 'FizzBuzz', fizz_buzz(77, fizz_number: 7, buzz_number: 11)
  end

  # 数値に変換できる文字列が入力された時、数値に変換し出力できるか
  def test_change_string_to_integer
    assert_equal '2', fizz_buzz('2')
    assert_equal 'Fizz', fizz_buzz('3')
    assert_equal 'Buzz', fizz_buzz('5')
    assert_equal 'FizzBuzz', fizz_buzz('15')
  end

  # 特殊な値の入力に対応するか
  def test_unexpected
    assert_equal 'FizzBuzz', fizz_buzz(0)
    assert_equal 'FizzBuzz', fizz_buzz('0')
    assert_equal 'FizzBuzz', fizz_buzz(-15)
    assert_equal 'Fizz', fizz_buzz(6, fizz_number: -3)
    assert_equal 'Buzz', fizz_buzz(10, buzz_number: -5)
    assert_equal 'FizzBuzz', fizz_buzz(15, fizz_number: -3, buzz_number: -5)
    assert_equal 'Buzz', fizz_buzz(10, fizz_number:3, buzz_number:5)
    assert_equal 'FizzBuzz', fizz_buzz(10, fizz_number:5, buzz_number:5)
  end

  # エラーの際に適切なエラーメッセージを出力できるか
  def test_output_error_message
    e = assert_raises ArgumentError do
      fizz_buzz('十五')
    end
    assert_equal '数値に変換できない値が入力されています。値:十五', e.message
  end

end
