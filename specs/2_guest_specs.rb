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

        @guest1 = Guest.new("Drake",10)
        @guest2 = Guest.new("Dan",10)
        @guest3 = Guest.new("Derrik",10)
        @two_guests = [@guest1,@guest2]
        @three_guests = [@guest1,@guest2,@guest3]

        @song_request1 = Song.new("This is Halloween")

        @room1 = Room.new("blue room", @Songs, 2)
        @occupied_room = Room.new ("red room", @songs, 3)
        @occupied_room.check_in_guests(@two_guests)


    end

    def test_001_get_name_of_guest
        assert_equal("Drake",@guest1.get_name)
    end

    def test_002_get_wallet_value_of_guest
        assert_equal(10,@guest2.get_wallet)
    end
    def test_003_check_can_fit_guests_in_room_true
        assert(@room1.capacity_check(@two_guests))
    end

    def test_004_check_can_fit_guests_in_room_false
        refute(@room1.capacity_check(@three_guests))
    end

    def test_005_request_songs
        update_song_request(@song_request1)
    end

    def test_006_transfer_song_request_to_playlist
        update_playlist(@song_request1)
    end

    def test_007_guests_check_into_new_room
        check_in_guests(@two_guests)
        assert_equal(10,@room1.get_tab)
        assert(@room1.get_room_in_use_status)
    end

    def test_008_guests_try_to_check_into_occupied_room
        assert_equal("error",@occupied_room.check_in_guests)
    end

    def test_008_check_out_of_room
        check_out(@room1)
        assert_equal(0,@room1.clear_tab)
        assert_equal(10,@room1.get_money_earned)
        refute(@room1.get_room_in_use_status)
    end


end
