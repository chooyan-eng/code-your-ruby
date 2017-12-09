require_relative '../lib/fizz_buzz'
require 'minitest/autorun'

# 引数の型チェックのテスト
class TestCheckType < Minitest::Test
  # 数値に変換できない文字列や、実行範囲外の数値が入力された時エラーを出力できるか
  def test_raise_error
    assert_raises ArgumentError do
      check_type(0)
    end
    assert_raises ArgumentError do
      check_type('0')
    end
    assert_raises ArgumentError do
      check_type('十五')
    end
    assert_raises ArgumentError do
      check_type(1.14)
    end
  end

  # エラーの際に適切なエラーメッセージを出力できるか
  def test_output_error_message
    e = assert_raises ArgumentError do
      fizz_buzz('十五')
    end
    assert_equal '実行範囲外の値が引数に渡されています 値:十五', e.message
  end

end

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

end
