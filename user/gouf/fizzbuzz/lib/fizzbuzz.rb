module FizzBuzzExtension
  refine Numeric do
    def fizz?
      modulo(3).zero?
    end

    def buzz?
      modulo(5).zero?
    end

    def fizz_buzz?
      modulo(15).zero?
    end
  end
end

module FizzBuzz
  using FizzBuzzExtension

  def self.detect(n)
    return 'FizzBuzz' if n.fizz_buzz?
    return 'Fizz' if n.fizz?
    return 'Buzz' if n.buzz?
    n.to_s
  end
end
