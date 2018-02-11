require "./core/protrol.rb"
def get_value(such)
  if /^ \$/ =~ such
    a=such
    a.slice!(0,2)
    if $Var.include?(such)
      return $Var[a]
    else
      $NoVarErr.throw(a)
    end
  else
    return such
  end
end
def get_value_block(such)
  if /^ \$/ =~ such
    a=such
    a.slice!(0,2)
    if $S_Var.include?(such)
      return $S_Var[a]
    else
      $NoVarErr.throw(a)
    end
  else
    return such
  end
end