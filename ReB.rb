require "./modules/kernel.rb"
if ARGV[0] == "-v"
  puts "ReactBasic 1.14 (2018-3-11) By RBasicTeam"
  exit()
end
puts "==ReactBASIC==" 
if ARGV[0] == nil
  $NoFileErr.throw(nil)
end
if FileTest.exist?(ARGV[0]) != true
  $NoFileErr.throw(ARGV[0])
end
BasicScirpt=File.read(ARGV[0])
if BasicScirpt[-1] == "\n"
  BasicScirpt.slice!(-1)
end
Basic=BasicScirpt.split(".")
Basic.each do |i|
  ReactBasic_Parse(i)
end
puts
puts "==End=="