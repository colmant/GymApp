class Ticket < ApplicationRecord
    belongs_to :user
    belongs_to :gym
    
    validates :name, presence: true, format: { with: /\A[A-Z][a-z]+\s[A-Z][a-z]+\z/, message: "must include both first and last, separated by a space and properly capitalized" }
    
    @@queueTop = Ticket.where('floor = ?', 'top').order(:created_at).to_a
    @@queueBottom = Ticket.where('floor = ?', 'bottom').order(:created_at).to_a
    
    cattr_accessor :queueTop
    cattr_accessor :queueBottom
    
    def get_position_top
        if (User.current.admin)
            @@queueTop.index(self) + 1
        else
            @ticket = Ticket.find_by(user: User.current)
            @@queueTop.index(@ticket) + 1
        end
    end
    
    def get_position_bottom
        if (User.current.admin)
            @@queueBottom.index(self) + 1
        else
            @ticket = Ticket.find_by(user: User.current)
            @@queueBottom.index(@ticket) + 1
        end
    end


end
