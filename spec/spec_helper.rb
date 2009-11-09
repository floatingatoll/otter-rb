require 'rubygems'
require 'minittest/spec'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'otter-rb'

MiniTest::Unit.autorun
