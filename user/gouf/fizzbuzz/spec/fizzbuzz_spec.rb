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
end
