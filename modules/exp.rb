require "./modules/kernel.rb"
require "./core/tokens.rb"
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
    if $Var[list[0]]=="True"
        $Var[list[1]]="False"
    elsif $Var[list[0]]=="False"
        $Var[list[1]]="True"
    end
  end
  if /^var:/ =~ list[0]
    list[0].slice!(0,5) 
    $Var[list[1]]=list[0]
  end
end