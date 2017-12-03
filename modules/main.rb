require "/root/Desktop/RBASIC/0.03/modules/kernel.rb"
require "/root/Desktop/RBASIC/0.03/modules/exp.rb"
def RBasicMain(such)
  Parse_Basic(such)
  RBasicExp(such)
end

def RBasicBlockMain(such)
  Parse_Block(such)
end