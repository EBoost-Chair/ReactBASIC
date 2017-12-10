require "./modules/kernel.rb"
require "./modules/exp.rb"
def RBasicMain(such)
  Parse_Basic(such)
  RBasicExp(such)
end

def RBasicBlockMain(such)
  Parse_Block(such)
end