require_relative '../lib/fizz_buzz'
require 'minitest/autorun'

# fizz_buzz_問題のテスト
class TestFizzBuzz < Minitest::Test
  # ノーマルパターン
  def test_fizz_buzz_normal
    assert_equal '1', fizz_buzz(1)
    assert_equal '2', fizz_buzz(2)
    assert_equal 'Fizz', fizz_buzz(3)
    assert_equal '4', fizz_buzz(4)
    assert_equal 'Buzz', fizz_buzz(5)
    assert_equal 'FizzBuzz', fizz_buzz(15)
  end

  # アレンジパターン
  def test_fizz_buzz_arrange
    assert_equal '6', fizz_buzz(6, fizz_number: 7, buzz_number: 11)
    assert_equal 'Fizz', fizz_buzz(7, fizz_number: 7, buzz_number: 11)
    assert_equal 'Buzz', fizz_buzz(11, fizz_number: 7, buzz_number: 11)
    assert_equal 'FizzBuzz', fizz_buzz(77, fizz_number: 7, buzz_number: 11)
  end

  # 数値に変換できる文字列が入力された時、数値に変換し出力できるか
  def test_fizz_buzz_change_string_to_integer
    assert_equal '2', fizz_buzz('2')
    assert_equal 'Fizz', fizz_buzz('3')
    assert_equal 'Buzz', fizz_buzz('5')
    assert_equal 'FizzBuzz', fizz_buzz('15')
  end

  # 数値に変換できない文字列が出力された時、エラーを出力できるか
  def test_fizz_buzz_out_put_error
    # ArgumentErrorが発生することを検証
    e = assert_raises ArgumentError do
      fizz_buzz('十五')
    end
    # エラーメッセージを検証
    assert_equal '数値に変換できない値が引数に渡されています', e.message
  end

end
