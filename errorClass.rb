$stdout.sync=true
class RBasicErr
  def initalize(aname="UnknownError",more="Unknown Error")
    @name=aname
  end
  def throw(ext)
    print @name
    print ":"
    puts ext
  end
  def name=(value)
    @name=value
  end
  def name
    @name
  end
end
