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

    def get_fav_song
        return @fav_song
    end

    def get_group_size
        return @group_size
    end

end
