require './lib/timetable/timetable'
require './lib/timetable/base_start_time'
class ExpressTimetable < Timetable
  def initialize(start_time)
    @base_start_at_times = [15, 35, 55]
    @train_running_duration = 60 * 2
    @stop_station_duration = 60 * 1
    super
  end

  def prepare(station_list)
    result = []
    current = detect_start_time
    station_list.each do |station|
      if station[:id] == 'SS0'
        result.push({ station: station, arrive_at: current, start_at: current })
      else
        arrive_at = current + train_running_duration
        waiting_time = station[:express_stop] ? stop_station_duration : 0
        start_at = arrive_at + waiting_time
        result.push({ station: station, arrive_at: arrive_at, start_at: start_at })
        current = start_at
      end
    end
    result
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
end
