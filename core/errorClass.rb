$stdout.sync=true
class RBasicErr
  def initalize(aname="UnknownError")
    @name=aname
  end
  def throw(ext)
    print @name
    print ":"
    puts ext
    exit()
  end
  def name=(value)
    @name=value
  end
  def name
    @name
  end
end
