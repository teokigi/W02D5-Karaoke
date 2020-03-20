class Guest
    def initialize(name,wallet)
        @name = name
        @wallet = wallet
    end




    def capacity_check(guests)
        if guests.length <= @capacity
            return true
        else
            return false
        end
    end
end
