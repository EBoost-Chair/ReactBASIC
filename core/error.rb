require "./core/errorClass.rb"
$NoCmdErr=RBasicErr.new()
$NoCmdErr.name="NoCommandError"
$NoVarErr=RBasicErr.new()
$NoVarErr.name="NoVariableError"
$NoSubErr=RBasicErr.new()
$NoSubErr.name="NoSubError"
$NoFileErr=RBasicErr.new()
$NoFileErr.name="NoFileError"
$CalcErr=RBasicErr.new()
$CalcErr.name="CalculateError"