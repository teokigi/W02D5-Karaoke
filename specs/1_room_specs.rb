require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new
require_relative('../1_room.rb')
require_relative('../0_song.rb')

class RoomTest < Minitest::Test
#block #1: add songs to room
#block #2: limited number of guests per room
    def setup
        @song1 = Song.new("Happy Birthday")
        @song2 = Song.new("Merry Christmas")
        @song3 = Song.new("Happy New Year")
        @Songs = [@song1,@song2]

        @room1 = Room.new("blue room", @Songs, 2)

        @Guest1 = Guest.new("Jim")
        @Guest2 = Guest.new("Tim")
        @Guest3 = Guest.new("Kim")
        @two_guests = [@guest1,@guest2]
        @three_guests = [@guest1,@guest2,@guest3]
    end

    def test_001_get_name
        assert_equal("blue room",@room1.get_name)
    end

    def test_002_get_song_list
        assert_equal(["Happy Birthday", "Merry Christmas"], @room1.get_playlist)
    end

    def test_003_get_room_capacity
        assert_equal(2,@room1.get_room_limit)
    end

    def test_004_check_can_fit_guests_in_room_true
        assert(@room1.capacity_check(@two_guests))
    end

    def test_005_check_can_fit_guests_in_room_false
        refute(@room1.capacity_check("three_guests"))
    end
