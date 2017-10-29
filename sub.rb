require "/root/Desktop/RBASIC/0.01_G/parsecore.rb"
def RBasicSub(such)
  list=such.split("|")
  list.each do |i|
    Parse_Block(i)
  end
end