#!/usr/bin/ruby -W0
# RBasic.rb
# Ruby BASIC complier
# Need:Define,Var,Call
require "/root/Desktop/RBASIC/0.02_G/modules/main.rb"
require "/root/Desktop/RBASIC/0.02_G/core/tokens.rb"
require "/root/Desktop/RBASIC/0.02_G/core/error.rb"
if FileTest.exist?(ARGV[0]) != true
  $NoFileErr.throw(ARGV[0])
end 
BasicScirpt=File.read(ARGV[0])
BasicScirpt.chomp!()
Basic=BasicScirpt.split(";")
Basic.each do |loop|
  RBasicMain(loop)
  if $NoCmd_a == 1 && $NoCmd_b == 1
    $NoCmdErr.throw(loop)
  end
end
