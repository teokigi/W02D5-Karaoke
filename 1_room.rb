class Room

    def initialize(name, songs, room_size)
        @name = name
        @songs = songs
        @capacity = room_size
        @money_earned = 0
        @tab = 0
        @room_in_use = false
        @guests = []
        @requests = []
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

    def add_song(new_song)
        @songs.push(new_song)
    end

    def get_capacity
        return @capacity
    end

    def total_guests
        return @guests.length
    end

    def add_guests(new_guest)
        @guests.push(new_guest)
    end

    def clearout_guests
        @guests = []
    end

    def get_tab
        return @tab
    end

    def add_to_tab(addition_amount)
        @tab += addition_amount
    end

    def room_status
        return @room_in_use
    end

    def occupy_room
        @room_in_use = true
    end

    def unoccupy_room
        @room_in_use = false
    end

    def add_guests(incoming_guests)
        @guests.push(incoming_guests)
    end

    def clearout_guests
        @guests = []
    end

    def total_requests
        return @requests.length
    end

    def add_requests(new_request)
        @requests.push(new_request)
    end

    def remove_requests(request)
        @requests.delete(request)
    end

end
