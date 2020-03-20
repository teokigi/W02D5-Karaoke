require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new
require_relative('../0_song.rb')

class SongTest < Minitest::Test
    def setup
        @song1 = Song.new("Happy Birthday")
        @song2 = Song.new("Merry Christmas")
        @songs = [@song1,@song2]
    end

#get a songs name
    def test_001_song_get_name
        assert_equal("Happy Birthday", @song1.get_name)
    end

end
