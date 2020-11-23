class RemoveEmailFromTickets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :email, :string
  end
end
