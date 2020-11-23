class AddFloorToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :floor, :string
  end
end
