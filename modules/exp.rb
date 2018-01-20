#!/usr/bin/ruby
# exp.rb
# Ruby BASIC's expression module.
# By Lonely_Man<2754887003@qq.com>
require "./modules/kernel.rb"
require "./core/tokens.rb"
require "./core/protrol.rb"
def RBasicExp(such)
  $NoCmd_b=0
  if such.include?(">>") == false
    $NoCmd_b=1
  end
  list=such.split(">>")
  if /^compare:/ =~ list[0]
    list[0].slice!(0,9)
    sub_list=list[0].split("|")
    if $Var[sub_list[0]] == $Var[sub_list[1]]
      $Var[list[1]]="True"
    else
      $Var[list[1]]="False"
    end
  end
  if /^eql:/ =~ list[0]
    list[0].slice!(0,4)
    $Var[list[1]]=$Var[list[0]]
  end
  if /^not:/ =~ list[0]
    list[0].slice!(0,5)
    if $S_Var[list[0]]=="True"
        $S_Var[list[1]]="False"
    elsif $S_Var[list[0]]=="False"
        $S_Var[list[1]]="True"
    end
  end
  if /^var:/ =~ list[0]
    list[0].slice!(0,5)
    $S_Var[list[1]]=list[0]
  end
end
def RBasicBlockExp(such)
  $NoCmd_b=0
  if such.include?(">>") == false
    $NoCmd_b=1
  end
  list=such.split(">>")
  if /^compare:/ =~ list[0]
    list[0].slice!(0,9)
    sub_list=list[0].split("|")
    if $Var[sub_list[0]] == $Var[sub_list[1]]
      $Var[list[1]]="True"
    else
      $Var[list[1]]="False"
    end
  end
  if /^eql:/ =~ list[0]
    list[0].slice!(0,4)
    $Var[list[1]]=$Var[list[0]]
  end
  if /^not:/ =~ list[0]
    list[0].slice!(0,5)
    if $Var[list[0]]=="True"
        $Var[list[1]]="False"
    elsif $Var[list[0]]=="False"
        $Var[list[1]]="True"
    end
  end
  if /^var:/ =~ list[0]
    list[0].slice!(0,4)
    $S_Var[list[1]]=list[0]
  end
end
def RBasicExpCheck(such)
  $PCheck_a=0
  if such.include?(">>")
  else
    $PCheck_a=1   
  end
end
