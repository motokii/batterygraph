#!/usr/bin/ruby
$:.unshift File.dirname(__FILE__)  # ロードパスにカレントディレクトリを追加
require 'logger.rb'

logger = Logger.new
logger.get_data
logger.write_log


