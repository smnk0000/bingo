require "rubygems"
require "bundler"
require File.dirname(__FILE__) + '/app/bingo'

use ActiveRecord::ConnectionAdapters::ConnectionManagement

run Bingo
