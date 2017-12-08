# fizz_buzz問題を出力
def fizz_buzz(number, fizz_number: 3, buzz_number: 5)
  # 入力数値の型チェック
  number = if number.kind_of?(Integer)
             number
           elsif !number.to_i.zero? || number == '0'
             number.to_i
           else
             raise ArgumentError.new("数値に変換できない値が引数に渡されています")
           end

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

