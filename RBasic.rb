#!/usr/bin/ruby -W0
# RBasic.rb
# Ruby BASIC's main script.
# By Lonely_Man<2754887003@qq.com>
# Need:Define,Var,Call
require "./modules/main.rb"
require "./core/tokens.rb"
require "./core/error.rb"
if ARGV[0] == "-v"
  puts "rbasic 1.04 (2018-1-18) By RBasicTeam"
  exit()
end
if FileTest.exist?(ARGV[0]) != true
  $NoFileErr.throw(ARGV[0])
end 
BasicScirpt=File.read(ARGV[0])
BasicScirpt.chomp!()
Basic=BasicScirpt.split(";")
Basic.each do |loop|
  if ARGV[1]=="--debug"
    print "["
    msg=loop.delete("\n")
    print msg
    print "]"
    puts ""
  end
  RBasicMain(loop)
  if $NoCmd_a == 1 && $NoCmd_b == 1
    $NoCmdErr.throw(loop)
  end
end
