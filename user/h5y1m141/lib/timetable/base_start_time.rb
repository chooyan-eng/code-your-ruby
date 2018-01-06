require 'time'
class BaseStartTime
  attr_accessor :base_times

  def initialize(args)
    @base_times = args[:base_times]
    @start_time = args[:start_time]
  end

  def start_time_minute
    Time.parse(@start_time).min
  end

  def prepare
    target = @base_times.select do |base_time|
      base_time >= start_time_minute
    end
    minute = target.empty? ? 0 : target.first
    hour = Time.parse(@start_time).hour
    hour = target.empty? ? hour + 1 : hour
    Time.new(2018, 1, 1, hour, minute)
  end
end
