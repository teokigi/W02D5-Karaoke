class Guest


    def capacity_check(guests)
        if guests.length <= @capacity
            return true
        else
            return false
        end
    end
end
