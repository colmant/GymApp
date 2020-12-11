require 'rails_helper'

RSpec.describe TrudyTrend, type: :model do
  it "should have many days" do
    n = TrudyTrend.reflect_on_association(:time)
    expect(n.macro).to eq(:has_many)
    end
  end