#!/usr/bin/ruby
require "/root/Desktop/RBASIC/0.02_Y/errorClass.rb"
require "/root/Desktop/RBASIC/0.02_Y/error.rb"
require "/root/Desktop/RBASIC/0.02_Y/sub.rb"
$Var={}
$Sub={}
def Parse_Basic(such)
  if /^PRINT/ =~ such
    such.slice!(0,8)
    such.slice!(-1)
    puts(such)
  elsif /^CPRINT/ =~ such
    such.slice!(0,9)
    such.slice!(-1)
    print(such)
  elsif /^END/ =~ such
    puts()
    exit()
  elsif /^REM/ =~ such
  elsif /^START/ =~ such
  elsif /^SET/ =~ such
    such.slice!(0,5)
    list = such.split("#")
    $Var[list[0]]=list[1]
  elsif /^SUB/ =~ such
    such.slice!(0,5)
    list = such.split("#")
    $Sub[list[0]]=list[1]
  elsif /^VPRINT/ =~ such
    such.slice!(0,8)
    if $Var.include?(such)
      puts($Var[such])
    else
      $NoVarErr.throw(such)
    end
  elsif /^EVAL/ =~ such
    such.slice!(0,7)
    such.slice!(-1)
    list=such.split("|")
    list.each do |i|
      Parse_Block(i)
    end
  elsif /^EXCUTE/ =~ such
    such.slice!(0,8)
    RBasicSub($Sub[such])
  else
    $NoCmdErr.throw(such)
  end
end
def Parse_Block(such)
  if /^PRINT/ =~ such
    such.slice!(0,7)
    such.slice!(-1)
    puts(such)
  elsif /^CPRINT/ =~ such
    such.slice!(0,9)
    such.slice!(-1)
    print(such)
  elsif /^END/ =~ such
    puts()
    exit()
  elsif /^REM/ =~ such
  elsif /^START/ =~ such
  elsif /^SET/ =~ such
    such.slice!(0,5)
    list = such.split("#")
    $Var[list[0]]=list[1]
  elsif /^VPRINT/ =~ such
    such.slice!(0,7)
    if $Var.include?(such)
      puts($Var[such])
    else
      $NoVarErr.throw(such)
    end
  elsif /^EVAL/ =~ such
    such.slice!(0,7)
    such.slice!(-1)
    list=such.split("|")
    list.each do |i|
      Parse_Block(i)
    end
  else
    $NoCmdErr.throw(such)
  end
end