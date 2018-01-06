require './lib/timetable/timetable'
require './lib/timetable/base_start_time'
class LocalTimetable < Timetable
  attr_reader :waiting_express_stations

  def initialize(start_time)
    super
    @start_time = start_time
    @base_start_at_times = [0, 10, 20, 30, 40, 50]
    @train_running_duration = 60 * 3
    @stop_station_duration = 60 * 1
    @current = detect_start_time
    @waiting_express_stations = detect_stations_for_waiting_express
  end

  def prepare(station_list)
    result = []
    station_list.each do |station|
      if station[:id] == 'SS0'
        result.push({ station: station, arrive_at: @current, start_at: @current })
      else
        arrive_at = @current + train_running_duration
        start_at = arrive_at + calcuate_stop_duration(station)
        result.push({ station: station, arrive_at: arrive_at, start_at: start_at })
        @current = start_at
      end
    end
    result
  end

  def calcuate_stop_duration(station)
    base_time = stop_station_duration
    waiting_express_stations.include?(station[:id]) ? base_time + 60 * 1 : base_time
  end

  def start_time_minute
    super
  end

  def detect_start_time
    arguments = {
      start_time: @start_time,
      base_times: @base_start_at_times
    }
    base_time = BaseStartTime.new(arguments)
    base_time.prepare
  end

  def detect_stations_for_waiting_express
    # 後続の急行がある場合
    if [10, 30, 50].include?(@current.min)
      ['SS3']
    else
      ['SS9']
    end
  end
end
