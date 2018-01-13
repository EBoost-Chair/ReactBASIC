#!/usr/bin/ruby
# error.rb
# Ruby BASIC's errors are defined at here
# You can define your custom errors at
# this folder or in you module(not recommended).
# By Lonely_Man<2754887003@qq.com>
$NoCmdErr=RBasicErr.new()
$NoCmdErr.name="NoCommandError"
$NoVarErr=RBasicErr.new()
$NoVarErr.name="NoVariantError"
$NoSubErr=RBasicErr.new()
$NoSubErr.name="NoSubError"
$NoFileErr=RBasicErr.new()
$NoFileErr.name="NoFileError"
