require 'minitest/autorun'
require 'bunny'
require 'bunny_mock'
Bunny.stubs(:new).returns(BunnyMock::Bunny.new)
Hutch::Config.log_level = Logger::ERROR
