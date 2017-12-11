# fizz_buzz問題を出力
def fizz_buzz(number, fizz_number: 3, buzz_number: 5)
  # 引数の型チェック
  number, fizz_number, buzz_number = [number, fizz_number, buzz_number].map { |val|
    if val.kind_of?(Integer)
      val
    elsif !val.to_i.zero? || val == '0'
      val.to_i
    else
      raise ArgumentError.new("数値に変換できない値が入力されています。値:#{val}")
    end
  }

  # fizz_buzz判定(割り切れるかどうか)
  fizz = (number % fizz_number).zero?
  buzz = (number % buzz_number).zero?

  if fizz && buzz
    'FizzBuzz'
  elsif fizz
    'Fizz'
  elsif buzz
    'Buzz'
  else
    number.to_s
  end
end

