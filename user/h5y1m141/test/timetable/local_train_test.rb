require 'minitest/autorun'
require './lib/timetable/station'
require './lib/timetable/timetable'
require './lib/timetable/local_timetable'
require './lib/timetable/local_train'
class LocalTrainTest < MiniTest::Unit::TestCase
  def setup
    station = Station.new
    @station_list = station.seibu_shinjuku_list
    @local_train = LocalTrain.new(start_time: '11:09')
  end

  def test_stop_stations
    stations = @local_train.stop_stations
    station_ss1 = stations.select {|target| target[:id] == 'SS1' }.first
    station_ss21 = stations.select {|target| target[:id] == 'SS21' }.first
    assert_equal('SS1', station_ss1[:id])
    assert_equal('SS21', station_ss21[:id])
  end
end
