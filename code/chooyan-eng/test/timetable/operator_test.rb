require 'minitest/autorun'
require './lib/timetable/operator'
require './lib/timetable/train'

class OperatorTest < Minitest::Test
  def test_new_local_train_at_11_10
    @operator = Operator.new("11:10")
    assert @operator.new_local_train? 
  end

  def test_not_new_local_train_at_11_11
    @operator = Operator.new("11:11")
    assert !@operator.new_local_train?
  end

  def test_new_express_train_at_11_15
    @operator = Operator.new("11:15")
    assert @operator.new_express_train? 
  end

  def test_not_new_local_train_at_11_16
    @operator = Operator.new("11:16")
    assert !@operator.new_express_train?
  end

  def test_new_train_at_11_10
    @operator = Operator.new("11:10")
    assert @operator.new_train? 
  end

  def test_not_new_train_at_11_11
    @operator = Operator.new("11:11")
    assert !@operator.new_train?
  end
 
  def test_stop_express_at_SS01
    @operator = Operator.new("11:11")
    assert @operator.stop_express?(1)
  end

  def test_do_not_stop_express_at_SS03
    @operator = Operator.new("11:11")
    assert !@operator.stop_express?(3)
  end

  def test_timetable_full
    operator = Operator.new("11:11")

    train = Train.new("11:11", :local)
    (0...22).each { train.push("00:00") }

    assert operator.timetable_full?(train)
  end
end
