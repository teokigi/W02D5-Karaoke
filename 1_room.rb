class Room

    def initialize(name, songs, room_size)
        @name = name
        @songs = songs
        @capacity = room_size
    end

    def get_name
        return @name
    end

    def get_song_list
        playlist = @songs.map(&:get_name)
        return playlist
    end

    def total_songs
        return @songs.length
    end

    def get_capacity
        return @capacity
    end



end
