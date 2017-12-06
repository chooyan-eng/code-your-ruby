require 'minitest/autorun'
require './lib/timetable/timetable'

class TimetableTest < Minitest::Test
  def test_generate_timetable_at_11_09
    expected = 
    ["11:10",
     "11:14",
     "11:18",
     "11:23",
     "11:27",
     "11:31",
     "11:35",
     "11:39",
     "11:43",
     "11:47",
     "11:51",
     "11:55",
     "11:59",
     "12:03",
     "12:07",
     "12:11",
     "12:15",
     "12:19",
     "12:23",
     "12:27",
     "12:31",
     "12:34"]
    assert_equal expected, generate_timetable("11:09") 
  end 

  def test_generate_timetable_at_11_14
    expected = 
    ["11:15", 
     "11:18", 
     "11:20", 
     "11:22", 
     "11:24", 
     "11:26", 
     "11:28", 
     "11:30", 
     "11:33", 
     "11:35", 
     "11:37", 
     "11:39", 
     "11:42", 
     "11:44", 
     "11:46", 
     "11:48", 
     "11:51", 
     "11:54", 
     "11:57", 
     "12:00", 
     "12:03", 
     "12:05"]
    assert_equal expected, generate_timetable("11:14") 
  end
end
