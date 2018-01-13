#!/usr/bin/ruby
# errorClass.rb
# Ruby BASIC's error class
# RBasic's ErrorClass defined at here,ugly but works.
# By Lonely_Man<2754887003@qq.com>
$stdout.sync=true
class RBasicErr
  def initalize(aname="UnknownError")
    @name=aname
  end
  def throw(ext)
    print @name
    print ":"
    puts ext
    exit()
  end
  def name=(value)
    @name=value
  end
  def name
    @name
  end
end
