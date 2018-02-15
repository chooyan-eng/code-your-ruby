require './lib/timetable/station'
class Train
  attr_accessor :start_time, :type, :time_to_next
  attr_reader :timetable, :station_list

  def initialize(args)
    station = Station.new
    @start_time = args[:start_time]
    @station_list = station.seibu_shinjuku_list
  end

  def stop_stations
    raise NotImplementedError
  end

  def timetable_list
    raise NotImplementedError
  end

  def show_timetable
    raise NotImplementedError
  end
end
