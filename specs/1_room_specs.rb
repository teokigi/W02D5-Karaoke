require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new
require_relative('../1_room.rb')
require_relative('../0_song.rb')
require_relative('../2_guest.rb')

class RoomTest < Minitest::Test
#block #1: add songs to room
#block #2: limited number of guests per room
    def setup
        @song1 = Song.new("Happy Birthday")
        @song2 = Song.new("Merry Christmas")
        @song3 = Song.new("Happy New Year")
        @Songs = [@song1,@song2]

        @guest1 = Guest.new("jim",100)
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
        assert_equal(0,@room1.get_tab)
    end

    def test_005_add_room_tab
        assert_equal(5,@room1.add_to_tab(5))
    end

    def test_006_room_usage_status_true
        assert(@room1.room_status)
    end

    def test_007_room_usage_status_fail
        refute(@room1.room_status)
    end

    def test_008_total_guests
        assert(0,@room1.total_guests)
    end

    def test_009_add_guest
        @room1.add_guests(@guest1)
        assert_equal(1,@room1.total_guests)
    end

    def test_010_remove_guest
        @room1.add_guests(@guest1)
        @room1.remove_guests
        assert_equal(0,@room1.total_guests)
    end

    def test_011_total_song_requests
        assert_equal(0,@room1.total_requests)
    end

    def test_012_add_requests
        assert_equal(1,@room1.add_requests)
    end

    def test_013_remove_requests
        @room1.add_requests
        assert_equal(0,@room1.remove_requests)
    end
end
