require 'minitest/autorun'
require 'time'
require './lib/timetable/station'
require './lib/timetable/timetable'
require './lib/timetable/express_timetable'
class ExpressTimetableTest < MiniTest::Unit::TestCase
  def setup
    station = Station.new
    @station_list = station.seibu_shinjuku_list
    @express_timetable = ExpressTimetable.new('11:09')
  end

  def test_prepare
    list = @express_timetable.prepare(@station_list)
    station_ss3 = list.select {|target| target[:station][:id] == 'SS3'}.first
    station_ss4 = list.select {|target| target[:station][:id] == 'SS4'}.first
    station_ss9 = list.select {|target| target[:station][:id] == 'SS9'}.first
    station_ss10 = list.select {|target| target[:station][:id] == 'SS10'}.first
    station_ss21 = list.select {|target| target[:station][:id] == 'SS21'}.first
    assert_equal(22, station_ss3[:start_at].min)
    assert_equal(24, station_ss4[:start_at].min)
    assert_equal(35, station_ss9[:start_at].min)
    assert_equal(37, station_ss10[:start_at].min)
    assert_equal(5, station_ss21[:arrive_at].min)
  end

  def test_start_time_minute
    target_minute = @express_timetable.detect_start_time.min
    assert_equal(15, target_minute)
  end
end
