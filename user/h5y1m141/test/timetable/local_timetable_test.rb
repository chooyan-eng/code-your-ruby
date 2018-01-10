require 'minitest/autorun'
require 'time'
require './lib/timetable/station'
require './lib/timetable/timetable'
require './lib/timetable/local_timetable'
class LocalTimetableTest < MiniTest::Unit::TestCase
  def setup
    station = Station.new
    @station_list = station.seibu_shinjuku_list
    @local_timetable = LocalTimetable.new('11:09')
  end

  def test_prepare
    list = @local_timetable.prepare(@station_list)
    station_ss3 = list.select {|target| target[:station][:id] == 'SS3'}.first
    station_ss4 = list.select {|target| target[:station][:id] == 'SS4'}.first
    station_ss9 = list.select {|target| target[:station][:id] == 'SS9'}.first
    station_ss10 = list.select {|target| target[:station][:id] == 'SS10'}.first
    station_ss21 = list.select {|target| target[:station][:id] == 'SS21'}.first
    assert_equal(23, station_ss3[:start_at].min)
    assert_equal(27, station_ss4[:start_at].min)
    assert_equal(47, station_ss9[:start_at].min)
    assert_equal(51, station_ss10[:start_at].min)
    assert_equal(34, station_ss21[:arrive_at].min)
  end

  def test_calcuate_stop_duration
    calcuate_result1 = @local_timetable.calcuate_stop_duration(@station_list[1])
    calcuate_result2 = @local_timetable.calcuate_stop_duration(@station_list[3])
    calcuate_result3 = @local_timetable.calcuate_stop_duration(@station_list[9])
    assert_equal(60, calcuate_result1)
    assert_equal(120, calcuate_result2)
    assert_equal(60, calcuate_result3)
  end

  def test_start_time_minute
    target_minute = @local_timetable.detect_start_time.min
    assert_equal(10, target_minute)
  end

  def test_detect_start_time
    target_minute = @local_timetable.detect_start_time.min
    assert_equal(10, target_minute)
  end

  def test_detect_stations_for_waiting_express
    local_timetable1 = LocalTimetable.new('11:00')
    local_timetable2 = LocalTimetable.new('11:09')
    local_timetable3 = LocalTimetable.new('11:29')
    local_timetable4 = LocalTimetable.new('11:30')
    local_timetable5 = LocalTimetable.new('11:31')
    local_timetable6 = LocalTimetable.new('11:59')
    target1 = local_timetable1.detect_stations_for_waiting_express
    target2 = local_timetable2.detect_stations_for_waiting_express
    target3 = local_timetable3.detect_stations_for_waiting_express
    target4 = local_timetable4.detect_stations_for_waiting_express
    target5 = local_timetable5.detect_stations_for_waiting_express
    target6 = local_timetable6.detect_stations_for_waiting_express
    assert_equal(['SS9'], target1)
    assert_equal(['SS3'], target2)
    assert_equal(['SS3'], target3)
    assert_equal(['SS3'], target4)
    assert_equal(['SS9'], target5)
    assert_equal(['SS9'], target6)
  end
end
