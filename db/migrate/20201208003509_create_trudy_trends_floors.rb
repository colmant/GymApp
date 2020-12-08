class CreateTrudyTrendsFloors < ActiveRecord::Migration[6.0]
  def change
    create_table :trudy_trends_floors do |t|
      t.integer :average_queue_size_top
      t.integer :average_queue_size_bot
      t.decimal :average_queue_time_top, precision: 10, scale: 2
      t.decimal :average_queue_size_bot, precision: 10, scale: 2

      t.timestamps
    end
  end
end
