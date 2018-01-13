#!/usr/bin/ruby
# sub.rb
# An ugly small old core module.
# By Lonely_Man<2754887003@qq.com>
require "./modules/kernel.rb"
def RBasicSub(such)
  list=such.split("|")
  list.each do |i|
    RBasicBlockMain(i)
  end
end