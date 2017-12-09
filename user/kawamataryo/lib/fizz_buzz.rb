# 引数が処理可能な値か検査する
def check_type(number)
  if number.kind_of?(Integer) && number != 0
    number
  elsif !(number.kind_of?(Float)) && !number.to_i.zero? && number != '0'
    number.to_i
  else
    raise ArgumentError.new("実行範囲外の値が引数に渡されています 値:#{number}")
  end
end

# fizz_buzz問題を出力
def fizz_buzz(number, fizz_number: 3, buzz_number: 5)
  # 引数の型チェック
  number, fizz_number, buzz_number = [number, fizz_number, buzz_number].map { |num| check_type(num) }

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
