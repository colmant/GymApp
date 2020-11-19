class Gym < ApplicationRecord

    
    def add_top_floor
        self.top_floor_occupancy += 1 if self.top_floor_occupancy < 25
        self.wait_top_floor += 1 if self.top_floor_occupancy >= 25
    end
    
    def subtract_top_floor
        self.top_floor_occupancy -= 1 if self.top_floor_occupancy > 0
    end
    
    def add_bottom_floor
        self.top_bottom_occupancy += 1 if self.top_bottom_occupancy < 20
        self.wait_bottom_floor += 1 if self.bottom_floor_occupancy >= 20
    end
    
    def subtract_bottom_floor
        self.top_bottom_occupancy -= 1 if self.top_bottom_occupancy >= 0
    end
    
    def add_wait_top_floor
        self.wait_top_floor += 1
    end
    
    def subtract_wait_top_floor
        self.wait_top_floor -= 1 if self.wait_top_floor > 0
    end
    
    def add_wait_bottom_floor
        self.wait_bottom_floor += 1
    end
    
    def subtract_wait_bottom_floor
        self.wait_bottom_floor -= 1 if self.wait_top_floor > 0
    end
end
