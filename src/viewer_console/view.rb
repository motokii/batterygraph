#!/usr/bin/ruby
$:.unshift File.dirname(__FILE__) + "/../"  # ロードパスを追加
require 'logger/logger.rb'
require 'csv'

class Viewer
  def initialize()
    @logger = Logger.new
    @csv_data = CSV.read(@logger.file_path, headers: true)
  end

  def create_bar(current, max)
    current = current.to_i
    max = max.to_i
    percentage = 100 * current / max
#percentage = int(percentage);
    unit = percentage / 2
    bar = ''
    while 0 < unit
      bar = bar + '#'
      unit -= 1
    end
#bar = bar + ' ' + str(percentage) + '%'
    bar = bar + ' ' + percentage.to_s + '%'
  end

  def test_bar(current, max)
    puts create_bar(current, max)
  end

  def show()
    current_date = ""
    @csv_data.each do |data|
      date = data["time"].split(" ")[0]
      time = data["time"].split(" ")[1]

      if current_date != date
        current_date = date
        puts date
      end

      puts time + " " + create_bar(data["current"], data["max"])
    end
  end

end


viewer = Viewer.new
viewer.show


