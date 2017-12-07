# fizz_buzz問題を出力
def fizz_buzz(number, set_fizz=3, set_buzz=5)
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

