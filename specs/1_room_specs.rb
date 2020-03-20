require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use!
Minitest::Reporters::Specsreporters.new
require_relative('../1_room.rb')
