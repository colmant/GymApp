class Ticket < ApplicationRecord
    belongs_to :user
    belongs_to :gym
    
    validates :name, presence: true, format: { with: /\A[A-Z][a-z]+\s[A-Z][a-z]+\z/, message: "must include both first and last, separated by a space and properly capitalized" }
    
    @@queue = Ticket.order(:created_at).to_a
    
    cattr_accessor :queue
    
    def not_present?
        Ticket.find_by(user: User.current).nil?
    end
    
    def get_position
        if (User.current.admin)
            @@queue.index(self) + 1
        else
            @ticket = Ticket.find_by(user: User.current)
            @@queue.index(@ticket) + 1
        end
    end
    
    # def get_position_for_queue
    #     @@queue.index(self) + 1
    # end

end
