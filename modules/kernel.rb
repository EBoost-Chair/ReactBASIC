#!/usr/bin/ruby
require "./core/errorClass.rb"
require "./core/error.rb"
require "./core/sub.rb"
require "./core/funcKill.rb"
require "./core/tokens.rb"
require "./modules/main.rb"
def Parse_Basic(such)
  $NoCmd_a=0
  if /^Print/ =~ such
    such.slice!(0,8)
    such.slice!(-1)
    puts(such)
  elsif /^CPrint/ =~ such
    such.slice!(0,9)
    such.slice!(-1)
    print(such)
  elsif /^End/ =~ such
    puts()
    exit()
  elsif /^Rem/ =~ such
  elsif /^Start/ =~ such
  elsif /^Sub/ =~ such
    such.slice!(0,4)
    list = such.split("#")
    $Sub[list[0]]=list[1]
  elsif /^VPrint/ =~ such
    such.slice!(0,8)
    if $Var.include?(such)
      puts($Var[such])
    else
      $NoVarErr.throw(such)
    end
  elsif /^Eval/ =~ such
    such.slice!(0,7)
    such.slice!(-1)
    list=such.split("|")
    list.each do |i|
      Parse_Block(i)
    end
  elsif /^Excute/ =~ such
    such.slice!(0,8)
    if $Sub.include?(such)
      list=$Sub[such].split("|")
      list.each do |i|
        RBasicBlockMain(i)
      end
    else
      $NoSubErr.throw(such)
    end
    KillFunc()
  else
    $NoCmd_a=1
  end
end
def Parse_Block(such)
  $NoCmd_a=0
  if /^Print/ =~ such
    such.slice!(0,7)
    such.slice!(-1)
    puts(such)
  elsif /^CPrint/ =~ such
    such.slice!(0,9)
    such.slice!(-1)
    print(such)
  elsif /^End/ =~ such
    puts()
    exit()
  elsif /^Rem/ =~ such
  elsif /^Start/ =~ such
  elsif /^Set/ =~ such
    such.slice!(0,4)
    list = such.split("@")
    $S_Var[list[0]]=list[1]
  elsif /^VPrint/ =~ such
    such.slice!(0,7)
    if $Var.include?(such)
      puts($Var[such])
    else
      $NoVarErr.throw(such)
    end
  elsif /^Eval/ =~ such
    such.slice!(0,7)
    such.slice!(-1)
    list=such.split("|")
    list.each do |i|
      Parse_Block(i)
    end
  else
    $NoCmd_a=1
  end
end
