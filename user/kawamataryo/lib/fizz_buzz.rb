# fizz_buzz問題を出力
def fizz_buzz(number, set_fizz: 3, set_buzz: 5)
  # 入力数値の型チェッ
  number = if number.is_a?(Integer)
             number
           elsif !(number.to_i.zero?)  ||  number == '0'
             number.to_i
           else
             raise ArgumentError.new("数値に変換できない値が引数に渡されています")
           end

  fizz = (number % set_fizz).zero?
  buzz = (number % set_buzz).zero?

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

