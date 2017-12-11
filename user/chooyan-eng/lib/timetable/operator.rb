require 'time'

class Operator
  STATION_NUM = 22
  EXPRESS_STOP_STATION = [0, 1, 8, 12, 16, 17, 18, 19, 20, 21]

  def initialize(current_time)
    @current_time = Time.parse(current_time)
  end

  def tick!()
    @current_time += 1 * 60
  end

  def new_train?()
     new_local_train? || new_express_train? 
  end

  def new_local_train?()
    @current_time.min % 10 == 0
  end

  def new_express_train?()
    [15, 35, 55].include?(@current_time.min)
  end

  def new_train()
    if new_local_train?
      Train.new(@current_time, :local)
    elsif new_express_train?
      Train.new(@current_time, :express)
    else
      nil
    end
  end

  def stop_express?(station_num)
    EXPRESS_STOP_STATION.include?(station_num)
  end

  def current_time()
    @current_time.strftime("%H:%M")
  end

  def last_station?(train)
    train.timetable.size == STATION_NUM - 1
  end

  def timetable_full?(train)
    train.timetable.size == STATION_NUM
  end
end
