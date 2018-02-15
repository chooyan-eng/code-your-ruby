def fizz_buzz(number)
  case
  when Integer(number) <= 0
    number.to_s
  when (Integer(number) % 15) == 0
    'FizzBuzz'
  when (Integer(number) % 3) == 0
    'Fizz'
  when (Integer(number) % 5) == 0
    'Buzz'
  else
    number.to_s
  end
end
