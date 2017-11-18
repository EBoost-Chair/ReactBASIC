
  def throw(ext)
    print @name
    print ":"
    puts ext
  end
  def name=(value)
    @name=value
  end
  def name
    @name
  end
require "/root/Desktop/RBASIC/0.02_G/modules/kernel.rb"
def RBasicSub(such)
  list=such.split("|")
  list.each do |i|
    RBasicBlockMain(i)
  end
end
