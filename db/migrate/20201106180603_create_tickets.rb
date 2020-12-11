class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :name
      t.string :email
      # t.belongs_to :gym, :tickets, foreign_key: true
      t.timestamps
    end
  end
end
