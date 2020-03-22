class Guest
    def initialize(name,wallet,favourite_song,group_size)
        @name = name
        @wallet = wallet
        @fav_song = favourite_song
        @group_size = group_size
    end

    def get_name
        return @name
    end

    def get_wallet
        return @wallet
    end

    def get_fav_songs
        return @fav_song.get_name
    end

    def get_group_size
        return @group_size
    end

    def group_cheers
        return "woohoo"
    end
    def check_in(room_data)
        if room_data.get_capacity <= @group_size
            if room_data.room_status == false
                room_data.occupy_room
                room_data.add_to_tab(room_data.get_hire_cost)
                playlist = room_data.get_playlist
                matched = find_fav_song(room_data)
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
        for favourite_song in @fav_song
            for song in room_data.get_playlist
                if favourite_song.get_name == song
                    return group_cheers
                end
            end
        end
        return false
    end


end
