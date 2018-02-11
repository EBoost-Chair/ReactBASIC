require "./modules/kernel.rb"
if ARGV[0] == "-v"
  puts "ReactBasic 1.10 (2018-2-11) By RBasicTeam"
  exit()
end
if FileTest.exist?(ARGV[0]) != true
  $NoFileErr.throw(ARGV[0])
end 
BasicScirpt=File.read(ARGV[0])
BasicScirpt.chomp!()
Basic=BasicScirpt.split(".")
Basic.each do |i|
  ReactBasic_Parse(i)
end
