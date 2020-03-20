require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new
require_relative('../1_room.rb')


class RoomTest < Minitest::Test
#block #1: add songs to room
#block #2: limited number of guests per room
