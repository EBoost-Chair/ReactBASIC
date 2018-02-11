require "./modules/exp.rb"
require "./core/protrol.rb"
require "./core/error.rb"
def ReactBasic_Parse(such)
  if /^Print/ =~ such
    a=such
    a.slice!(0,6)
    a0=get_value(a)
    $Sym_Table.each do |i,j|
      a0.gsub!(i,j)
    end
    print a0
  elsif /^Set/ =~ such
    a=such
    a.slice!(0,5)
    list=a.split(",")
    if /^\$/ =~ list[1]
      b=" "
      b.concat(list[1])
      list[1]=b
    end
    $Var[list[0]]=get_value(list[1])
  elsif /^Rem/ =~ such
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
    $Sym_Table.each do |i,j|
      a0.gsub!(i,j)
    end
    print a0
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