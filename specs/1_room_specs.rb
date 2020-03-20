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
    end

    def test_001_get_name
        assert_equal("blue room",@room1.get_name)
    end

    def test_002_get_song_list
        assert_equal(["Happy Birthday", "Merry Christmas"], @room1.get_song_list)
    end

    def test_003_get_total_songs
        assert_equal(2,@room1.total_songs)
    end

    def test_003_get_room_capacity
        assert_equal(2,@room1.get_capacity)
    end

    def test_004_get_room_tab
        assert_equal(0,@room1.test_004_get_tab)
    end
end
