class Gym < ApplicationRecord
    has_many :tickets
    validate :check_record, on: :create #please not that validate in this case is singular

    def check_record
        if Gym.all.count === 1
          errors[:base] << "You can only have one gym"
        end
    end
    
    def add_top_floor
        self.top_floor_occupancy += 1 if self.top_floor_occupancy < 25
        #self.wait_top_floor += 1 if self.top_floor_occupancy >= 25
        self.save
    end
    
    def subtract_top_floor
        self.top_floor_occupancy -= 1 if self.top_floor_occupancy > 0
        self.save
    end
    
    def add_bottom_floor
        self.bottom_floor_occupancy += 1 if self.bottom_floor_occupancy < 20
        #self.wait_bottom_floor += 1 if self.bottom_floor_occupancy >= 20
        self.save
    end
    
    def subtract_bottom_floor
        self.bottom_floor_occupancy -= 1 if self.bottom_floor_occupancy >= 0
        self.save
    end
    
    def add_wait_top_floor
        self.wait_top_floor += 1
        self.save
    end
    
    def subtract_wait_top_floor
        self.wait_top_floor -= 1 if self.wait_top_floor > 0
        self.save
    end
    
    def add_wait_bottom_floor
        self.wait_bottom_floor += 1
        self.save
    end
    
    def subtract_wait_bottom_floor
        self.wait_bottom_floor -= 1 if self.wait_bottom_floor > 0
        self.save
    end
end
