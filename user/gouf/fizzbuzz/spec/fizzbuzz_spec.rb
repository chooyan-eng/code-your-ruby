shared_examples 'FizzBuzz' do |i, result|
  subject { FizzBuzz.detect(i) }
  it("will returns #{result} (n = #{i})") { is_expected.to eq result }
end

describe FizzBuzz do
  context 'divisible by 3 number' do
    divisible = [3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48,
                 51, 54, 57, 60, 63, 66, 69, 72, 75, 78, 81, 84, 87, 90, 93, 96, 99]
    divisible.each do |n|
      include_examples 'FizzBuzz', n, 'Fizz'
    end
  end

  context 'divisible by 5 number' do
    divisible = [5, 10, 15, 20, 25, 30, 35, 40, 45,
                 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100]

    divisible.each do |n|
      include_examples 'FizzBuzz', n, 'Buzz'
    end
  end

  context 'divisible by 15 number' do
    divisible = [15, 30, 45, 60, 75, 90]

    divisible.each do |n|
      include_examples 'FizzBuzz', n, 'FizzBuzz'
    end
  end

  context 'non-fizzbuzz number' do
    non_divisible = [1, 2, 4, 7, 8, 11, 13, 14, 16, 17, 19, 22, 23,
                     26, 28, 29, 31, 32, 34, 37, 38, 41, 43, 44, 46,
                     47, 49, 52, 53, 56, 58, 59, 61, 62, 64, 67, 68,
                     71, 73, 74, 76, 77, 79, 82, 83, 86, 88, 89, 91, 92, 94, 97, 98]

    non_divisible.each do |n|
      it "will returns #{n} as String" do
        expect(FizzBuzz.detect(n)).to eq n.to_s
      end
    end
  end
end
