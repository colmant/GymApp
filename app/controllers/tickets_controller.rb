class TicketsController < ApplicationController
    before_action :user_signed_in?, only:[:new, :create]
    
    def index
        @tickets = Ticket.order(:created_at)
        @gym = Gym.find_by(name: "Trudy")
    end
    
    def new 
        @ticket = Ticket.new 
    end
  
    def create
        @ticket = Ticket.new(ticket_params)
        @ticket.user = current_user
        @ticket.gym = Gym.find_by(name: "Trudy")
        if @ticket.save
            flash[:notice] = "New ticket for #{@ticket.name} created"
            increase_wait(@ticket)
            redirect_to "/" and return
        else
            flash[:alert] = "Failed to save new ticket"
            redirect_to new_ticket_path and return
        end
    end
    

    def destroy
        @ticket = Ticket.find(params[:id])
        increase_occupancy(@ticket)
        decrease_wait(@ticket)
        @ticket.destroy
        flash[:notice] = "#{@ticket.name} was admitted to the gym."
        redirect_to tickets_path and return
    end


    
    private
  
    def ticket_params
        params.require(:ticket).permit(:name, :email)
    end
    
    def increase_wait(t)
        t.floor == "top" ? t.gym.add_wait_top_floor() : t.gym.add_wait_bottom_floor()
    end
    
    def decrease_wait(t)
        t.floor == "top" ? t.gym.subtract_wait_top_floor() : t.gym.subtract_wait_bottom_floor()
    end
    
    def increase_occupancy(t)
        t.floor == "top" ? t.gym.add_top_floor() : t.gym.add_bottom_floor()
    end
    
    def decrease_occupancy(t)
        t.floor == "top" ? t.gym.subtract_top_floor() : t.gym.subtract_bottom_floor()
    end
    
end
