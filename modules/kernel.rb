#!/usr/bin/ruby
# kernel.rb
# Ruby BASIC's kernel functions module
# By Lonely_Man<2754887003@qq.com>
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
    a=such
    $Sym_Table.each do |i,j|
      a.gsub!(i,j)
    end
    puts(a)
  elsif /^CPrint/ =~ such
    such.slice!(0,9)
    such.slice!(-1)
    print(such)
  elsif /^Exit/ =~ such
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
    list=such.split("#")
    list[1].slice!(0)
    list[1].slice!(-1)
    list1=list[1].split(",")
    list1.each do |i|
      j=i.split(":")
      $S_Var[j[0]]=j[1]
    end
    if $Sub.include?(list[0])
      list0=$Sub[list[0]].split("|")
      $Name=such
      list0.each do |i|
        RBasicCheckMain(i)
        if $PCheck_a==1 && $PCheck_b==1
          $NoCmdErr.throw(i)
        end 
        RBasicBlockMain(i)
      end
      if $RTken==1
        $NoCmd_a=0
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
    $Sym_Table.each do |i,j|
      a.gsub!(i,j)
    end
    puts(such)
  elsif /^CPrint/ =~ such
    such.slice!(0,9)
    such.slice!(-1)
    print(such)
  elsif /^Exit/ =~ such
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
    if $S_Var.include?(such)
      a=$S_Var[such]
      $Sym_Table.each do |i,j|
        a.gsub!(i,j)
      end
      puts a
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
  elsif /^Return/ =~ such
    such.slice!(0,7)
    list=such.split(",")
    $Var[list[0]]=list[1]
  elsif /^EndSub/ =~ such
    $RTken=1
  else
    $NoCmd_a=1
  end
end
def RBasicKernelCheck(such)
  $PCheck_b=0
  if /^Print/ =~ such
  elsif /^CPrint/ =~ such
  elsif /^Exit/ =~ such
  elsif /^Rem/ =~ such
  elsif /^Start/ =~ such
  elsif /^Set/ =~ such
  elsif /^VPrint/ =~ such
  elsif /^Eval/ =~ such
  elsif /^Return/ =~ such
  elsif /^EndSub/ =~ such
  else
    $PCheck_b=1   
  end
end