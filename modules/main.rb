#!/usr/bin/ruby
# main.rb
# Ruby BASIC's modules should be 
# included and joined at here
# in order to  be recogonized by the RBasic main body.
# By Lonely_Man<2754887003@qq.com>
require "./modules/kernel.rb"
require "./modules/exp.rb"
def RBasicMain(such)
  Parse_Basic(such)
  RBasicExp(such)
end

def RBasicBlockMain(such)
  Parse_Block(such)
  RBasicBlockExp(such)
end