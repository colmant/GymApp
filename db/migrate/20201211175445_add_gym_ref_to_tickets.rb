class AddGymRefToTickets < ActiveRecord::Migration[6.0]
  def change
    add_reference :tickets, :gym, null: false, foreign_key: true
  end
end
