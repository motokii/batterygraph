#!/usr/bin/ruby
require 'fileutils'

class Logger
  @@file_name = "batterylog.csv"


  def initialize()
    #current_dir = File.expand_path(File.dirname(__FILE__)) #=> 実行中のスクリプトのパス
    @@file_dir = File.expand_path('~/.batterygraph')

    @@file_path = @@file_dir + '/' + @@file_name
  end

  def file_path
    @@file_path
  end

  # バッテリーのデータを取得
  def get_data
    ioreg = `/usr/sbin/ioreg -l`
    @capacity = ioreg.match(/"CurrentCapacity\D+(\d+)$/)[1]
    @cycle = ioreg.match(/"CycleCount\D+(\d+)$/)[1]
    @max = ioreg.match(/"MaxCapacity\D+(\d+)$/)[1]

    # 現在時刻取得
    @time = Time.now.strftime('%Y/%m/%d %H:%M')
  end

  # CSVファイルの1行分を返す
  def get_csv_row
    @time + ',' + @capacity + ',' + @max + ',' + @cycle
  end

  # 取得したデータをCSVファイルとして記録する
  def write_log
    puts "writed >>" + @@file_path
    puts get_csv_row()

    # ディレクトリがなければ作成
    FileUtils.mkdir_p(@@file_dir) unless FileTest.exist?(@@file_dir)

    # ファイルがなければヘッダを書き込む
    if !File.exist?(@@file_path) then
      # ファイルに書き込む
      File.open(@@file_path ,"w") do |file|
        file.puts("time,current,max,cycle")
      end
    end

    # ファイルにCSVの行を書き込む
    File.open(@@file_path ,"a") do |file|
      file.puts(get_csv_row())
    end
  end

end



