module FizzBuzzExtension
  refine Numeric do
    def fizz?
      modulo(3).zero?
    end

    def buzz?
      modulo(5).zero?
    end
  end
end

module FizzBuzz
  using FizzBuzzExtension

  def self.detect(n)
    return 'Fizz' if n.fizz?
    return 'Buzz' if n.buzz?
  end
end
