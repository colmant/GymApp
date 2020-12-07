class CreateTrudyTrends < ActiveRecord::Migration[6.0]
  def change
    create_table :trudy_trends do |t|
      t.DateTime :date
      t.name :day_of_week
      t.decimal :average_queue_time, precision: 10, scale: 2
      t.decimal :average_queue_time_top, precision: 10, scale: 2
      t.decimal :average_queue_time_bot, precision: 10, scale: 2
      t.integer :average_queue_size
      t.integer :average_queue_size_top
      t.integer :average_queue_size_bot

      t.timestamps
    end
  end
end
