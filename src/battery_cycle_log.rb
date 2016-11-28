#!/usr/bin/ruby

require 'date'

# 現在の日付を取得し、フォーマット変換して文字列出力
now = Date.today.strftime('%Y/%m/%d')
cyclecount = `/usr/sbin/ioreg -l | grep CycleCount | grep -v Design`.chomp.split(" = ")[1]

puts now+","+cyclecount
