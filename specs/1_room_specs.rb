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
        @songs = [@song1,@song2]
        @new_song = Song.new("This is Halloween")

        @guest1 = Guest.new("jim",100)
        @room1 = Room.new("blue room", @songs, 2)
    end

    def test_001_get_name
        assert_equal("blue room",@room1.get_name)
    end

    def test_002_get_song_list
        assert_equal(["Happy Birthday", "Merry Christmas"], @room1.get_song_list)
    end

    def test_003_get_total_songs_and_new_songs
#accertain current songs are 2
        assert_equal(2,@room1.total_songs)
#append 1 new song
        @room1.add_song(@new_song)
#accertain current songs are now 3
        assert_equal(3,@room1.total_songs)
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

    def test_006_room_usage_status
#room should start false as it isn't used
        refute(@room1.room_status)
#room should become true after being occupied
        @room1.occupy_room
        assert(@room1.room_status)
#room should return to false after use
        @room1.unoccupy_room
        refute(@room1.room_status)
    end

    def test_007_guests_testing
#test total_guests request
        assert_equal(0,@room1.total_guests)
#test adding guests
        @room1.add_guests(@guest1)
        assert_equal(1,@room1.total_guests)
#test clearing out guests
        @room1.clearout_guests
        assert_equal(0,@room1.total_guests)
    end

    def test_008_song_requests
        assert_equal(0,@room1.total_requests)
        @room1.add_requests(@new_song)
        assert_equal(1,@room1.total_requests)
        @room1.remove_requests(@new_song)
        assert_equal(0,@room1.total_requests)
    end

end
