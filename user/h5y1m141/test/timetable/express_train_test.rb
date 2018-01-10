require 'minitest/autorun'
require './lib/timetable/station'
require './lib/timetable/timetable'
require './lib/timetable/express_timetable'
require './lib/timetable/express_train'
class ExpressTrainTest < MiniTest::Unit::TestCase
  def setup
    station = Station.new
    @station_list = station.seibu_shinjuku_list
    @express_train = ExpressTrain.new(start_time: '11:09')
  end

  def test_stop_stations
    stations = @express_train.stop_stations
    station_ss1 = stations.select {|target| target[:id] == 'SS1' }.first
    station_ss3 = stations.select {|target| target[:id] == 'SS3' }.first
    station_ss21 = stations.select {|target| target[:id] == 'SS21' }.first
    assert_equal('SS1', station_ss1[:id])
    assert_equal(true, station_ss3.nil?)
    assert_equal('SS21', station_ss21[:id])
  end
end
