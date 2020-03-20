require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use!
Minitest::Reporters::Specsreporters.new
require_relative('../0_song.rb')
