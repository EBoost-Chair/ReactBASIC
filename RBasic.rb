#!/usr/bin/ruby -W0
# RBasic.rb
# Ruby BASIC's main script.
# By Lonely_Man<2754887003@qq.com>
# Need:Define,Var,Call
require "./modules/main.rb"
require "./core/tokens.rb"
require "./core/error.rb"
if ARGV.include?("-v")
  puts "rbasic 1.08 (2018-1-29) By RBasicTeam"
  exit()
end
if FileTest.exist?(ARGV[0]) != true
  $NoFileErr.throw(ARGV[0])
end 
BasicScirpt=File.read(ARGV[0])
if ARGV.include?("--debug")
  puts "[System:Script File has been read.]"
end
BasicScirpt.chomp!()
Basic=BasicScirpt.split(";")
if ARGV.include?("--debug")
  puts "[System:Start Script Parsing.]"
end
Basic.each do |loop|
  if ARGV.include?("--debug")
    print "["
    print "Script:"
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
if ARGV.include?("--debug")
  puts "[System:All Commands Ran Successfully.]"
end