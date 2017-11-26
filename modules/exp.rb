require "/root/Desktop/RBASIC/0.02_G/modules/kernel.rb"
require "/root/Desktop/RBASIC/0.02_G/core/tokens.rb"
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
  else
    list[0].delete!("\n")
    $Var[list[1]]=list[0]
  end
  if /^eql:/ =~ list[0]
    list[0].slice!(0,4)
    $Var[list[1]]=$Var[list[0]]
  end
end