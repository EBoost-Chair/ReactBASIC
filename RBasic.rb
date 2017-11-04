#!/usr/bin/ruby -W0
# RBasic
# Ruby BASIC complier
# Need:Define,Var,Call
require "/root/Desktop/RBASIC/0.02_Y/parsecore.rb"
BasicScirpt=File.read(ARGV[0])
Basic=BasicScirpt.split(";")
Basic.each do |loop|
  Parse_Basic(loop)
end
