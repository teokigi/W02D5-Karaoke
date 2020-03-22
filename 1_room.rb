class Room

    def initialize(name, songs, room_size, hire_cost)
        @name = name
        @playlist = songs
        @capacity = room_size
        @money_earned = 0
        @tab = 0
        @room_in_use = false
        @requests = []
        @hire_cost = hire_cost
    end

    def get_name
        return @name
    end

    def get_playlist
        playlist = @playlist.map(&:get_name)
        return playlist
    end

    def get_requests
        playlist = @requests.map(&:get_name)
        return playlist
    end

    def total_songs
        return @playlist.length
    end

    def add_song(new_song)
        @playlist.push(new_song)
    end

    def get_capacity
        return @capacity
    end

    def get_tab
        return @tab
    end

    def add_to_tab(addition_amount)
        @tab += addition_amount
    end

    def clear_tab
        @money_earned += @tab
        @tab = 0
    end

    def get_earnings
        return @money_earned
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

    def total_requests
        return @requests.length
    end

    def add_requests(new_request)
        @requests.push(new_request)
    end

    def remove_requests(request)
        @requests.delete(request)
    end

    def get_hire_cost
        return @hire_cost
    end
end
