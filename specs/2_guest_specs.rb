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
#block #3: anying extra? requesting new songs, room usage status
    def setup
        @song1 = Song.new("Happy Birthday")
        @song2 = Song.new("Merry Christmas")
        @song3 = Song.new("Happy New Year")
        @Songs = [@song1,@song2]

        @guest_fav_song = Song.new("My Immortal")
        @guest1 = Guest.new("Drake",100,@guest_fav_song,2)
        @guest2 = Guest.new("Jim",100,@guest_fav_song,3)

        @room1 = Room.new("blue room", @Songs, 2)
        @occupied_room = Room.new ("red room", @songs, 2)
        @occupied_room.check_in_guests(@guest1)


    end

    def test_001_get_name_of_guest
        assert_equal("Drake",@guest1.get_name)
    end

    def test_002_get_wallet_value_of_guest
        assert_equal(10,@guest2.get_wallet)
    end


    def test_005_guests_check_into_new_room
        @two_guests.check_in_guests(@room1)
        assert_equal(10,@room1.get_tab)
        assert(@room1.get_room_in_use_status)
    end

    def test_006_guests_try_to_check_into_occupied_room
        assert_equal("exceeds room capacity",@occupied_room.check_in_guests)
    end
    #test related to song requests
    #requested song array will be populated by favourite songs
    #taken from guests, compare song list with fav song list and append any
    #songs not listed to song requests
    def test_007_check_out_of_room
        check_out(@occupied_room)
        assert_equal(2,@occupied_room.total_requests)
        assert_equal(0,@occupied_room.clear_tab)
        assert_equal(10,@occupied_room.get_money_earned)
        refute(@occupied_room.get_room_in_use_status)
    end


end
