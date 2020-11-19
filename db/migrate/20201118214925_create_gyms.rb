class CreateGyms < ActiveRecord::Migration[6.0]
  def change
    create_table :gyms do |t|
      t.integer :top_floor_occupancy
      t.integer :bottom_floor_occupancy
      t.integer :top_floor_capacity
      t.integer :bottom_floor_capacity
      t.integer :wait_top_floor
      t.integer :wait_bottom_floor

      t.timestamps
    end
  end
end
