require 'rails_helper'
RSpec.describe Ticket, type: :model do
  it "should have one gym" do
    t = Ticket.reflect_on_association(:gym)
    expect(t.macro).to eq(:has_one)
  end
end
