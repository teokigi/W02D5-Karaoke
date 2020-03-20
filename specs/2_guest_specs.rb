require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new
require_relative('../2_guest.rb')


class GuestTest < Minitest::Test
#block #1: check in guests
#block #1: check out guests
#block #2: pay to get room
#block #2: limit guests per room
#block #3: favourite song results in cheer
#block #3: guests tab
#block #3: anying extra?



    def test_004_check_can_fit_guests_in_room_true
        assert(@room1.capacity_check(@two_guests))
    end

    def test_005_check_can_fit_guests_in_room_false
        refute(@room1.capacity_check(@three_guests))
    end
end
