require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new
require_relative('../2_guest.rb')
require_relative('../0_song.rb')
require_relative('../1_room.rb')


class GuestTest < Minitest::Test
#block #1: check in guests
#block #1: check out guests
#block #2: pay to get room
#block #2: limit guests per room
#block #3: favourite song results in cheer
#block #3: guests tab
#block #3: anying extra? requesting new songs, room usage status
    def setup
        @song1 = Song.new("Happy Birthday")
        @song2 = Song.new("Merry Christmas")
        @song3 = Song.new("Happy New Year")
        @songs = [@song1,@song2]

        @fav_song1 = Song.new("This is Halloween")
        @fav_song2 = Song.new("Merry Christmas")
        # @guest_fav_song = [@fav_song1,@fav_song2]
        @guest1 = Guest.new("Drake",100,@fav_song1,2)
        @guest2 = Guest.new("Jim",100,@fav_song2,3)

        @room1 = Room.new("blue room", @songs, 2, 10)
        @occupied_room = Room.new("red room", @songs, 2, 10)
        @guest1.check_in(@occupied_room)


    end

    def test_001_get_name_of_guest
        assert_equal("Drake",@guest1.get_name)
    end

    def test_002_get_wallet_value_of_guest
        assert_equal(100,@guest2.get_wallet)
    end


    def test_003_guests_check_into_new_room
        @guest1.check_in(@room1)
        assert_equal(10,@room1.get_tab)
        assert(@room1.room_status)
        assert_equal(1,@room1.total_requests)
        refute(@guest1.find_fav_song(@room1))
    end

    def test_004_found_fav_song
        @guest2.check_in(@room1)
        assert_equal("woohoo",@guest2.find_fav_song(@room1))
    end


    def test_005_guests_try_to_check_into_undercapacity_room
        assert_equal("exceeds room capacity",@guest2.check_in(@room1))
    end

    def test_006_guests_try_to_check_into_occupied_room
        assert_equal("room occupied",@guest1.check_in(@occupied_room))
    end
    #test related to song requests
    #requested song array will be populated by favourite songs
    #taken from guests, compare song list with fav song list and append any
    #songs not listed to song requests
    def test_007_check_out_of_room
        @guest1.check_out(@occupied_room)
        assert_equal(0,@occupied_room.get_tab)
        assert_equal(10,@occupied_room.get_earnings)
        refute(@occupied_room.room_status)
    end


end
