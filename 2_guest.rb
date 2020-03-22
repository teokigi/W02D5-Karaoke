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

    def check_in(room_data)
        if room_data.get_capacity <= @group_size
            room_data.occupy_room
            room_data.add_to_tab(room_data.get_hire_cost)
            playlist = room_data.get_playlist
            match = find_favourites(playlist)
            if match
                p "woohoo"
            end
        else
            return "exceeds room capacity"
        end
    end

    def check_out(room_data)
        

end
