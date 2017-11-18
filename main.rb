require "/root/Desktop/RBASIC/0.02_G/modules/kernel.rb"
require "/root/Desktop/RBASIC/0.02_G/modules/exp.rb"
def RBasicMain(such)
  Parse_Basic(such)
  RBasicExp(such)
end

def RBasicBlockMain(such)
  Parse_Block(such)
end