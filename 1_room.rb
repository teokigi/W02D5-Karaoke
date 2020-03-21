class Room

    def initialize(name, songs, room_size, guests)
        @name = name
        @songs = songs
        @capacity = room_size
        @money_earned = 0
        @tab = 0
        @room_in_use = false
        @guests = []
        @song_requests = []
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

    def total_guests
        return @guests.length
    end

    def get_tab
        return @tab
    end

    def add_to_tab(addition_amount)
        @tab += addition_amount
    end


end
