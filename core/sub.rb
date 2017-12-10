require "./modules/kernel.rb"
def RBasicSub(such)
  list=such.split("|")
  list.each do |i|
    RBasicBlockMain(i)
  end
end