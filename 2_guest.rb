class Guest
    def initialize(name,wallet,favourite_song,group_size)
        @name = name
        @wallet = wallet
        @fav_songs = favourite_song
        @group_size = group_size
    end

    def get_name
        return @name
    end

    def get_wallet
        return @wallet
    end

    def get_fav_songs
        return @fav_songs.get_name
    end

    def get_group_size
        return @group_size
    end

    def group_cheers
        return "woohoo"
    end
    def check_in(room_data)
        if room_data.get_capacity >= @group_size
            if room_data.room_status == false
                room_data.occupy_room
                room_data.add_to_tab(room_data.get_hire_cost)
                matched = find_fav_song(room_data)
                request_unlisted_fav_songs(room_data)
            else
                return "room occupied"
            end
        else
            return "exceeds room capacity"
        end
    end

    def check_out(room_data)
        pay_tab(room_data)
        room_data.clear_tab
        room_data.unoccupy_room
    end

    def pay_tab(room_data)
        @wallet -= room_data.get_tab
    end

    def find_fav_song(room_data)
            for song in room_data.get_playlist
                if @fav_songs.get_name == song
                    return group_cheers
                end
            end
        return false
    end

    def request_unlisted_fav_songs(room_data)
        match = 0
        for song in room_data.get_playlist
            if song == @fav_songs.get_name
                match += 1
            end
        end
        if match == 0
            room_data.add_requests(@fav_songs)
        end

    end
end
