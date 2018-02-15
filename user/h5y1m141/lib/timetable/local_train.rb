require './lib/timetable/train'
require './lib/timetable/local_timetable'
class LocalTrain < Train
  attr_reader :timetable

  def initialize(args)
    super
    @timetable = LocalTimetable.new(start_time)
  end

  def stop_stations
    local_stop_names
  end

  def timetable_list
    result = timetable.prepare(station_list).map do |r|
      target = r[:station][:id] == 'SS21' ? r[:arrive_at] : r[:start_at]
      format_datetime(target)
    end
    result
  end

  def format_datetime(target)
    target.strftime('%H:%M')
  end

  private

  def local_stop_names
    station_list.select { |station| station[:local_stop]}
  end
end
