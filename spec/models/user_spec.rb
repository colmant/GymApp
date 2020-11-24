require 'rails_helper'

RSpec.describe User, type: :model do
  it "should have one ticket" do
    u = User.reflect_on_association(:ticket)
    expect(u.macro).to eq(:has_one)
  end
end
