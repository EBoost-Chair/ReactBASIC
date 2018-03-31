Int a,1.
Arg a:$a,b:1.
Sub a:
 Int b,1
 Add a,b,a
 Call b
End.
Sub b:
 Print $a
 Print ~n
 Call a
End.
Call b().