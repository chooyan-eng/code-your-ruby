require 'time'
class Timetable
  attr_reader :start_time, :base_start_at_times, :train_running_duration,
              :stop_station_duration
  attr_accessor :current

  def initialize(start_time)
    @start_time = start_time
    @current = Time.new(2018, 1, 1, 0, 0)
  end

  def prepare
    raise NotImplementedError
  end

  def detect_start_time
    raise NotImplementedError
  end
end
