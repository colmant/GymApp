class Ticket < ApplicationRecord
    belongs_to :user
    validates :name, presence: true, length: { minimum: 5 }, format: { with: /\A[A-Z][a-z]+\s[A-Z][a-z]+\z/, message: "must include both first and last, separated by a space and properly capitalized" }
    
    def not_present?
        Ticket.find_by(user: User.current).nil?
    end
    
    def get_position
        @ticket = Ticket.find_by(user: User.current).id
    end
end
