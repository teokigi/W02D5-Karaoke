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
    def setup
        @song1 = Song.new("Happy Birthday")
        @song2 = Song.new("Merry Christmas")
        @song3 = Song.new("Happy New Year")
        @Songs = [@song1,@song2]

        @room1 = Room.new("blue room", @Songs, 2)

        @guest1 = Guest.new("Drake",100)
        @guest2 = Guest.new("Dan",100)
        @guest3 = Guest.new("Derrik",0)
        @two_guests = [@guest1,@guest2]
        @three_guests = [@guest1,@guest2,@guest3]
    end



    def test_004_check_can_fit_guests_in_room_true
        assert(@room1.capacity_check(@two_guests))
    end

    def test_005_check_can_fit_guests_in_room_false
        refute(@room1.capacity_check(@three_guests))
    end
end
