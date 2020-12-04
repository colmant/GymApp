require 'rails_helper'
RSpec.describe Gym, type: :model do
  it "should have many tickets" do
    g = Gym.reflect_on_association(:tickets)
    expect(g.macro).to eq(:has_many)
    end
  end
    
    context "the subtract_bottom_floor method" do
        it "should remove 1 from bottom_floor_occupancy" do
            g = Gym.new(:name => "Trudy", :top_floor_occupancy => 1, :bottom_floor_occupancy => 1, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
            g.subtract_bottom_floor
            expect(g.bottom_floor_occupancy).to eq(0)
        end
    end
    
    context "the subtract_top_floor method" do
        it "should check that subtract_top_floor removes 1 from top_floor_occupancy" do
            g = Gym.new(:name => "Trudy", :top_floor_occupancy => 1, :bottom_floor_occupancy => 0, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
            g.subtract_top_floor
            expect(g.top_floor_occupancy).to eq(0)
        end
    end
    
    context "the add_top_floor method" do
        it "should check that add_top_floor add 1 to top_floor_occupancy" do
            g = Gym.new(:name => "Trudy", :top_floor_occupancy => 0, :bottom_floor_occupancy => 0, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
            g.add_top_floor
            expect(g.top_floor_occupancy).to eq(1)
        end
    end
    
    context "the add_bottom_floor method" do
        it "should check that add_bottom_floor add 1 to bottom_floor_occupancy" do
            g = Gym.new(:name => "Trudy", :top_floor_occupancy => 0, :bottom_floor_occupancy => 0, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
            g.add_bottom_floor
            expect(g.bottom_floor_occupancy).to eq(1)
        end
    end
