class TicketsController < ApplicationController
    before_action :user_signed_in?, only:[:new, :create]
    
    def index
        @tickets = Ticket.order(:created_at)
    end
    
    def new 
        @ticket = Ticket.new
    end
  
    def create
        @ticket = Ticket.new(ticket_params)
        @ticket.user = current_user
        if @ticket.save
            flash[:notice] = "New ticket for #{@ticket.name} created"
            redirect_to "/" and return
        else
            errmsg = @ticket.errors.full_messages.join(", ")
            flash[:alert] = "Error creating new ticket: #{errmsg}"
            redirect_to new_ticket_path and return
        end
    end
    
    def destroy
        @ticket = Ticket.find(params[:id])
        @ticket.destroy
        flash[:notice] = "#{@ticket.name} was admitted to the gym."
        redirect_to tickets_path and return
    end
    
    private
 
    def ticket_params
        params.require(:ticket).permit(:name, :floor)
    end
    
end
