class Train
  attr_accessor :start_time, :type, :time_to_next
  attr_reader :timetable

  def initialize(start_time, type)
    @start_time = start_time
    @type = type
    @timetable = []
    @time_to_next = 0
  end

  def push(time)
    @timetable << time
  end

  def local?()
    @type == :local
  end

  def express?()
    @type == :express
  end

  def running?()
    @time_to_next != 0
  end
end
