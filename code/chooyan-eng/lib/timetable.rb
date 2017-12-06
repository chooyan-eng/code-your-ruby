require './lib/operator'
require './lib/train'

def generate_timetable(time)
  operator = Operator.new(time)
  train = loop do
    if operator.new_train?
      break operator.new_train
    end
    operator.tick!
  end

  train.push(operator.current_time)
  
  if train.local?
    # todo: @chooyan-eng    
  elsif train.express?
    train.time_to_next = 2
    loop do
      operator.tick!
      if train.running?
        train.time_to_next -= 1
        if !train.running?
          if operator.stop_express?(train.timetable.size)
            if operator.last_station?(train)
              train.push(operator.current_time)
              break
            end
          else
            train.push(operator.current_time)
            train.time_to_next = 2
          end
        end
      else
        train.push(operator.current_time)
        train.time_to_next = 2
      end
    end
  end
  train.timetable
end
