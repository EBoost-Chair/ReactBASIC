require "./modules/kernel.rb"
if ARGV[0] == "-v"
  puts "ReactBasic 1.16 (2018-3-31) By RBasicTeam"
  exit()
end
puts "==ReactBASIC==" 
if ARGV[0] == nil
  $NoFileErr.throw(nil)
end
if FileTest.exist?(ARGV[0]) != true
  $NoFileErr.throw(ARGV[0])
end
basicScirpt=File.read(ARGV[0])
if basicScirpt[-1] == "\n"
  basicScirpt.slice!(-1)
end
basicScirpt = "\n" + basicScirpt
Basic=basicScirpt.split(".")
Basic.each do |i|
  ReactBasic_Parse(i)
end
puts
puts "==End=="