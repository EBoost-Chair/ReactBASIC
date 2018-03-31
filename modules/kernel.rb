require "./modules/exp.rb"
require "./core/protrol.rb"
require "./core/error.rb"
def ReactBasic_Parse(such)
  if /^Print/ =~ such
    a=such
    if a[7]=="$"
      a.slice!(0,6)
    else
      a.slice!(0,7)
    end
    a0=get_value(a)
    # a0.to_s()
    if a0.class!=String
      print a0
    else
      $Sym_Table.each do |i,j|
        a0.gsub!(i,j)
      end
      print a0
    end
  elsif /^Add/ =~ such
    b=such
    b.slice!(0,5)
    list=b.split(",")
    if $Var.include?(list[0]) != true
      $NoVarErr.throw(list[0])
    end
    if $Var.include?(list[1]) != true
      $NoVarErr.throw(list[1])
    end
    if $Var[list[0]].class != $Var[list[1]].class
      $CalcErr.throw(list[0].to_s+","+list[1].to_s)
    end
    if $Var[list[0]].class == TrueClass || $Var[list[0]] == FalseClass
      $CalcErr.throw(list[0])
    end
    if $Var[list[1]].class == TrueClass || $Var[list[1]] == FalseClass
      $CalcErr.throw(list[1])
    end
    $Var[list[2]]=$Var[list[0]]+$Var[list[1]]
  elsif /^String/ =~ such
    a=such
    a.slice!(0,8)
    list=a.split(",")
    $Var[list[0]]=get_value(list[1])
  elsif /^Equal/ =~ such
    a=such
    a.slice!(0,7)
    list=a.split(",")
    if $Var.include?(list[0]) != true
      $NoVarErr.throw(list[0])
    else
      $Var[list[1]]=$Var[list[0]]
    end      
  elsif /^Exit/ =~ such
    exit()
  elsif /^Sleep/ =~ such
    a=such
    a.slice!(0,6)
    a0=a.to_i()
    sleep(a0)
  elsif /^Sub/ =~ such
    a=such
    a.slice!(0,5)
    a.slice!(-1)
    a.slice!(-1)
    a.slice!(-1)
    a.slice!(-1)
    list=a.split(":")
    $Sub[list[0]]=list[1]
  elsif /^Arg/ =~ such
    a=such
    a.slice!(0,5)
    list=a.split(",")
    list.each do |i|
      j=i.split(":")
      if /^\$/ =~ j[1]
        b=" "
        b.concat(j[1])
        j[1]=b        
      end
      $S_Var[j[0]]=get_value(j[1])
    end
  elsif /^Int/ =~ such
    a=such
    a.slice!(0,5)
    list=a.split(",")
    $Var[list[0]]=list[1].to_i()
  elsif /^Bool/ =~ such
    a=such
    a.slice!(0,6)
    list=a.split(",")
    if list[1]=="true"
      $Var[list[0]]=true
    else
      $Var[list[0]]=false
    end
  elsif /^Call/ =~ such
    b=such
    b.slice!(0,6)
    list=b.split("(")
    a=list[0]
    list[1].slice!(-1)
    list0=list[1].split(",")
    list0.each do |i|
      j=i.split(":")
      if /^\$/ =~ j[1]
        b=" "
        b.concat(j[1])
        j[1]=b        
      end
      $S_Var[j[0]]=get_value(j[1])
    end
    if $Sub.include?(a)
      a0=$Sub[a]
      list=a0.split("\n ")
      list.delete("")
      list.each do |i|
        ReactBasic_Parse_block(i)
      end
    else
      $NoSubErr.throw(a)
    end
    $S_Var={}
  elsif /^Rem/ =~ such
  else
    $NoCmdErr.throw(such)
  end
end


def ReactBasic_Parse_block(such)
  if /^Print/ =~ such
    a=such
    if a[6]=="$"
      a.slice!(0,5)
    else
      a.slice!(0,6)
    end
    a0=get_value_block(a)
    if a0.class!=String
      print a0
    else
      $Sym_Table.each do |i,j|
        a0.gsub!(i,j)
      end
      print a0
    end
  elsif /^Add/ =~ such
    b=such
    b.slice!(0,4)
    list=b.split(",")
    if $S_Var.include?(list[0]) != true
      $NoVarErr.throw(list[0])
    end
    if $S_Var.include?(list[1]) != true
      $NoVarErr.throw(list[1])
    end
    if $S_Var[list[0]].class != $S_Var[list[1]].class
      $CalcErr.throw(list[0].to_s+","+list[1].to_s)
    end
    if $S_Var[list[0]].class == TrueClass || $S_Var[list[0]] == FalseClass
      $CalcErr.throw(list[0])
    end
    if $S_Var[list[1]].class == TrueClass || $S_Var[list[1]] == FalseClass
      $CalcErr.throw(list[1])
    end
    $S_Var[list[2]]=$S_Var[list[0]]+$S_Var[list[1]]
  elsif /^Call/ =~ such
    a=such
    a.slice!(0,5)
    if $Sub.include?(a)
      a0=$Sub[a]
      list=a0.split("\n ")
      list.delete("")
      list.each do |i|
        ReactBasic_Parse_block(i)
      end
    else
      $NoSubErr.throw(a)
    end
    $S_Var={}
  elsif /^Call_If/ =~ such
    b=such
    b.slice!(0,8)
    list=b.split(",")
    if /^\$/ =~ list[0]
      b=" "
      b.concat(list[0])
      list[0]=b      
    end
    c=get_value(list[0])
    if c=="true" || c==true 
      if $Sub.include?(list[1])
        a0=$Sub[list[1]]
        list=a0.split("\n ")
        list.delete("")
        list.each do |i|
          ReactBasic_Parse_block(i)
        end
      else
        $NoSubErr.throw(list[1])
      end
    end
  elsif /^Exit/ =~ such
    exit()
  elsif /^Int/ =~ such
    a=such
    a.slice!(0,4)
    list=a.split(",")
    $S_Var[list[0]]=list[1].to_i()
  elsif /^Bool/ =~ such
    a=such
    a.slice!(0,5)
    list=a.split(",")
    if list[1]=="true"
      $S_Var[list[0]]=true
    else
      $S_Var[list[0]]=false
    end
  elsif /^Set/ =~ such
    a=such
    a.slice!(0,4)
    list=a.split(",")
    if /^\$/ =~ list[1]
      b=" "
      b.concat(list[1])
      list[1]=b
    end
    $S_Var[list[0]]=get_value_block(list[1])
  elsif /^Rem/ =~ such
  elsif /^Sleep/ =~ such
    a=such
    a.slice!(0,6)
    a0=a.to_i()
    sleep(a0)
  else
    $NoCmdErr.throw(such)
  end
end