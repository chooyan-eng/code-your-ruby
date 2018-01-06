require './lib/timetable/local_train'
require './lib/timetable/express_train'
local_train = LocalTrain.new(start_time: '11:09')
express_train = ExpressTrain.new(start_time: '11:02')
puts "各駅停車の時刻表\n#{local_train.timetable_list}"
puts "急行の時刻表\n#{express_train.timetable_list}"
