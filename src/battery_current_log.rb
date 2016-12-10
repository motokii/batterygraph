#!/usr/bin/ruby

# 現在時刻取得
now = Time.now.strftime('%Y/%m/%d,%H:%M')
capacity = `/usr/sbin/ioreg -l | grep CurrentCapacity`.chomp.split(" = ")[1]

puts now+','+capacity
