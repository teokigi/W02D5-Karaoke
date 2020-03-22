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

    # def check_in(room_data)
    #     room_data.occupy_room
    # end


end
