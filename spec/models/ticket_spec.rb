require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it "should belong to one user" do
    t = Ticket.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end
end
